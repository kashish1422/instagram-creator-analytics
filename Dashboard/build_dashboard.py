"""Build the Instagram Creator Analytics web dashboard.

Reads the cleaned dataset, compresses it into a compact columnar JSON payload,
and injects it into dashboard_template.html to produce a single self-contained
index.html (no server, no external libraries) that can be opened locally or
hosted on GitHub Pages.

Usage (from the repository root):
    python Dashboard/build_dashboard.py
"""

from pathlib import Path
import json

import pandas as pd

ROOT = Path(__file__).resolve().parent.parent
DATA_PATH = ROOT / "Data" / "Cleaned" / "instagram_creator_cleaned.csv"
TEMPLATE_PATH = Path(__file__).resolve().parent / "dashboard_template.html"
OUTPUT_PATH = Path(__file__).resolve().parent / "index.html"

DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]


def encode(series: pd.Series, order=None):
    """Dictionary-encode a categorical column -> (labels, integer codes)."""
    labels = list(order) if order is not None else sorted(series.unique())
    lookup = {label: i for i, label in enumerate(labels)}
    return labels, series.map(lookup).astype(int).tolist()


def main() -> None:
    df = pd.read_csv(DATA_PATH, parse_dates=["post_date"])

    # Basic validation so the dashboard never silently ships bad data.
    required = [
        "account_id", "account_type", "media_type", "content_category", "traffic_source",
        "has_call_to_action", "post_date", "post_hour", "day_of_week", "likes", "comments",
        "shares", "saves", "reach", "impressions", "followers_gained", "total_engagement",
    ]
    missing = [c for c in required if c not in df.columns]
    if missing:
        raise ValueError(f"Missing columns: {missing}")
    if (df["reach"] <= 0).any():
        raise ValueError("Reach must be positive to compute engagement rate.")

    df["month"] = df["post_date"].dt.to_period("M").astype(str)
    months = sorted(df["month"].unique())

    account_types, at = encode(df["account_type"])
    media_types, mt = encode(df["media_type"], ["image", "carousel", "reel"])
    categories, cat = encode(df["content_category"])
    traffic, ts = encode(df["traffic_source"])
    _, mo = encode(df["month"], months)
    _, dw = encode(df["day_of_week"], DAYS)

    payload = {
        "meta": {
            "rows": int(len(df)),
            "accounts": int(df["account_id"].nunique()),
            "start": df["post_date"].min().strftime("%Y-%m-%d"),
            "end": df["post_date"].max().strftime("%Y-%m-%d"),
        },
        "dims": {
            "accountTypes": account_types,
            "mediaTypes": media_types,
            "categories": categories,
            "traffic": traffic,
            "months": months,
            "days": DAYS,
        },
        "cols": {
            "at": at, "mt": mt, "cat": cat, "ts": ts, "mo": mo, "dw": dw,
            "h": df["post_hour"].astype(int).tolist(),
            "cta": df["has_call_to_action"].astype(int).tolist(),
            "lk": df["likes"].astype(int).tolist(),
            "cm": df["comments"].astype(int).tolist(),
            "sh": df["shares"].astype(int).tolist(),
            "sv": df["saves"].astype(int).tolist(),
            "rc": df["reach"].astype(int).tolist(),
            "im": df["impressions"].astype(int).tolist(),
            "fg": df["followers_gained"].astype(int).tolist(),
        },
    }

    template = TEMPLATE_PATH.read_text(encoding="utf-8")
    marker = "/*__DATA__*/null"
    if marker not in template:
        raise ValueError("Data marker not found in template.")
    html = template.replace(marker, json.dumps(payload, separators=(",", ":")))
    OUTPUT_PATH.write_text(html, encoding="utf-8")

    size_kb = OUTPUT_PATH.stat().st_size / 1024
    print(f"Wrote {OUTPUT_PATH.relative_to(ROOT)} ({len(df):,} posts, {size_kb:,.0f} KB)")


if __name__ == "__main__":
    main()
