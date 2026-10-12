# Data Requirements

## 1. Purpose

This document defines the data requirements for the Instagram Creator Analytics project and records how the selected dataset supports the business questions, KPIs, and analysis.

## 2. Selected Dataset

The primary dataset contains:

- **Records:** 29,999 posts
- **Original columns:** 23
- **Unique accounts:** 20
- **Cleaned dataset:** 29,999 rows and 25 columns

The primary dataset was selected for the analysis. Other evaluated datasets were not integrated because of duplication, missing identifiers, or conflicting data.

## 3. Data Fields and Their Uses

| Data requirement | Purpose |
|---|---|
| Post ID | Identify individual posts |
| Post date/time | Analyze posting patterns and performance over time |
| Media type | Compare image, carousel, and reel performance |
| Content category | Compare performance across content categories |
| Reach | Measure audience reach |
| Impressions | Measure content exposure |
| Likes | Measure likes received |
| Comments | Measure comments received |
| Shares | Measure content sharing |
| Saves | Measure saved content |
| Followers gained | Analyze recorded follower gains |
| Traffic source | Compare engagement across traffic sources |
| Call to action | Compare average engagement for posts with and without a CTA |

## 4. Derived Fields

The cleaned dataset includes the following derived fields:

### Total Engagement

Total Engagement = Likes + Comments + Shares + Saves

### Calculated Engagement Rate

Calculated Engagement Rate = (Total Engagement / Reach) × 100

The calculated engagement rate is kept separate from the source engagement-rate field.

## 5. Data Preparation

Data preparation included:

1. Standardizing column names to lowercase snake_case.
2. Parsing date and datetime fields.
3. Creating total engagement.
4. Calculating engagement rate using reach.
5. Validating the cleaned dataset.
6. Preparing the data for SQL, Python, and Power BI analysis.

## 6. Data Limitations

The current analysis should not assume the availability of:

- Historical follower counts over time.
- Profile visits or verified follows attributed to individual posts.
- Caption-length analysis.
- Hashtag-count or individual hashtag performance analysis.
- Viewer-to-follower conversion data.

These metrics should only be included in future analysis if suitable data becomes available.

## 7. Data Quality and Assumptions

The cleaned primary dataset contains 29,999 rows and 25 columns. The original dataset had no exact duplicate rows or initial missing values.

Additional datasets were not combined with the primary dataset because their data quality or structure did not support reliable integration.

Analysis findings describe observed associations and patterns. They do not establish that a content characteristic caused a particular result.

## 8. Tools

- Python and Pandas for data cleaning and exploratory analysis.
- MySQL for data storage and SQL analysis.
- Power BI for interactive dashboards and KPI reporting.
- Git and GitHub for version control and project sharing.