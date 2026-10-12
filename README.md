# Instagram Creator Analytics

An end-to-end data analytics project exploring Instagram content performance, audience engagement, reach, impressions, and follower growth using SQL, Python, and Power BI.

## Project Overview

This project analyzes Instagram creator post data to identify performance patterns and translate them into actionable content-strategy recommendations.

The analysis examines how media types, content categories, posting times, traffic sources, and calls to action relate to engagement and follower growth.

## Business Objectives

- Measure overall Instagram content performance.
- Compare engagement across media types and content categories.
- Explore relationships between posting time and engagement.
- Evaluate performance across traffic sources.
- Investigate the relationship between engagement and follower growth.
- Develop data-informed recommendations for content strategy.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning, validation, and exploratory data analysis |
| Pandas | Data manipulation and analysis |
| MySQL | Data storage, querying, and SQL analysis |
| Power BI | Interactive dashboard and visualization |
| DAX | KPI calculations and dashboard measures |
| Git & GitHub | Version control and project sharing |

## Project Workflow

1. Business understanding
2. Dataset evaluation
3. Data cleaning and validation
4. Database preparation and SQL analysis
5. Python exploratory data analysis
6. KPI analysis and visualization
7. Power BI dashboard development
8. Business insights and recommendations
9. Documentation and project presentation

## Project Structure

```text
Instagram_Creator_Analysis/
├── Data/
│   └── Cleaned/
├── Documents/
│   └── insights_and_recommendations.md
├── Python/
│   └── data_understanding.ipynb
├── SQL/
│   └── analysis.sql
├── PowerBI/
│   └── Instagram_Creator_Analytics.pbix
├── .gitignore
└── README.md
```

*Note: The tree highlights the main project files. Your local folders may contain additional files.*

## Dataset Overview

- **Primary dataset:** 29,999 Instagram post records
- **Original columns:** 23
- **Unique accounts:** 20
- **Cleaned dataset:** 29,999 rows and 25 columns

Data preparation included standardizing column names, parsing date fields, validating records, and deriving total engagement and a calculated engagement rate.

The additional datasets evaluated during the project were not combined with the primary dataset because of duplication, missing identifiers, or conflicting data.

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Posts | 29,999 |
| Total Engagement | 10,593,229 |
| Average Engagement per Post | 353.12 |
| Average Reach | 6,272.48 |
| Average Impressions | 8,466.95 |
| Average Calculated Engagement Rate | 5.62% |
| Total Followers Gained | 15,064,082 |
| Average Followers Gained per Post | 502.15 |

## Key Findings

### 1. Content Category
- Fashion recorded the highest average engagement at approximately 363.92 per post.
- Music recorded the highest average follower growth at approximately 512.87 per post.
- Photography achieved the highest average reach among the analyzed categories.

### 2. Media Type
- Image posts recorded slightly higher average engagement than carousels and reels.
- Carousels recorded the highest average follower growth among the three media types.
- The differences in average engagement across formats were relatively small.

### 3. Posting Time
- 3 AM had the highest observed average engagement among posting hours.
- Sunday had the highest average engagement among days of the week.
- These are observed patterns, not proof of a universally optimal posting schedule.

### 4. Traffic Sources
- External traffic had the highest average engagement among the analyzed traffic sources.
- Profile traffic had the highest average calculated engagement rate.

### 5. Engagement vs. Follower Growth
- The correlation between engagement and follower growth was approximately -0.005.
- This indicates almost no linear relationship in this dataset; engagement alone should not be treated as a reliable indicator of follower growth.

## Business Recommendations

- Test content categories and formats against specific goals.
- Track engagement and follower growth as separate performance metrics.
- Experiment with posting windows while considering audience time zones.
- Monitor traffic sources to understand where engagement comes from.
- Evaluate different calls to action rather than assuming their presence guarantees better performance.
- Collect additional metrics, such as profile visits and follower conversion, to better understand growth.

These recommendations are based on observed associations in the available dataset. They do not establish causation.

## Power BI Dashboard

The interactive dashboard contains four main pages:

- **Overview:** Core KPIs and high-level performance insights
- **Content Performance:** Comparisons across media types and content categories
- **Audience & Growth:** Follower growth patterns and engagement relationships
- **Posting Time Analysis:** Engagement and reach patterns by posting hour and day

The dashboard uses an Instagram-inspired visual theme and interactive navigation and filters.

## Project Documentation

- [Insights and Recommendations](Documents/insights_and_recommendations.md)
- [SQL Analysis](SQL/analysis.sql)
- [Python Analysis](Python/data_understanding.ipynb)

## How to Explore the Project

1. Clone or download this repository.
2. Review the cleaned dataset in `Data/Cleaned/`.
3. Open the Python notebook to explore data preparation and analysis.
4. Run the SQL queries against a MySQL database configured with the project table.
5. Open `PowerBI/Instagram_Creator_Analytics.pbix` in Power BI Desktop to explore the dashboard.

**Note:** The SQL analysis expects the `instagram_creator_analytics` database and the `instagram_posts` table to be configured in MySQL. Update connection and import steps as needed for your environment.

## Limitations

- Findings describe the available dataset and may not generalize to all Instagram creators.
- Observational patterns do not establish cause and effect.
- Posting-time results can be affected by sample size, audience composition, and other factors.
- More conversion-related metrics would be needed to explain follower growth fully.

## About This Project

This project demonstrates an end-to-end analytics workflow, from data preparation and SQL querying to exploratory analysis, dashboard development, and business recommendations.