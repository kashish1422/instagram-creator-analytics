-- Instagram Creator Analytics
-- MySQL Analysis

-- 1. DATABASE VERIFICATION

-- Question:1 Which database are we currently using?

USE instagram_creator_analytics;

-- Which tables exist in the database?

SELECT DATABASE();

-- Which tables exist in the database?

SHOW TABLES;

-- How many posts are available in the dataset?

SELECT COUNT(*) AS total_posts
FROM instagram_posts;

-- 2. BASIC KPI ANALYSIS

-- 2.1 Total Posts
-- Question: How many posts are in the dataset?
-- How many posts are in the dataset?

SELECT COUNT(*) AS total_posts
FROM instagram_posts;

-- 2.2 Total Unique Accounts
-- Question: How many unique accounts are represented?
-- How many unique accounts are represented?

SELECT COUNT(DISTINCT account_id) AS total_accounts
FROM instagram_posts;

-- 2.3 Total Engagement
-- Question: How much total engagement did all posts generate?
-- How much total engagement did all posts generate?

SELECT
    SUM(likes) AS total_likes,
    SUM(comments) AS total_comments,
    SUM(shares) AS total_shares,
    SUM(saves) AS total_saves,
    SUM(total_engagement) AS total_engagement
FROM instagram_posts;

-- 2.4 Average Engagement
-- Question: What is the average engagement per post?
-- What is the average engagement per post?

SELECT
    ROUND(AVG(likes), 2) AS avg_likes,
    ROUND(AVG(comments), 2) AS avg_comments,
    ROUND(AVG(shares), 2) AS avg_shares,
    ROUND(AVG(saves), 2) AS avg_saves,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts;

-- 2.5 Reach
-- Question: How much audience reach do posts generate?
-- How much audience reach do posts generate?

SELECT
    SUM(reach) AS total_reach,
    ROUND(AVG(reach), 2) AS avg_reach,
    MAX(reach) AS max_reach,
    MIN(reach) AS min_reach
FROM instagram_posts;

-- 2.6 Impressions
-- Question: How much visibility do posts generate?
-- How much visibility do posts generate?

SELECT
    SUM(impressions) AS total_impressions,
    ROUND(AVG(impressions), 2) AS avg_impressions,
    MAX(impressions) AS max_impressions,
    MIN(impressions) AS min_impressions
FROM instagram_posts;

-- 2.7 Follower Growth
-- Question: How many followers were gained from posts?
-- How many followers were gained from posts?

SELECT
    SUM(followers_gained) AS total_followers_gained,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    MAX(followers_gained) AS max_followers_gained,
    MIN(followers_gained) AS min_followers_gained
FROM instagram_posts;

-- 2.8 Engagement Rate
-- Question: What are the source and calculated engagement rate ranges?
-- What are the source and calculated engagement rate ranges?

SELECT
    ROUND(AVG(engagement_rate), 4) AS avg_source_engagement_rate,
    ROUND(MIN(engagement_rate), 4) AS min_source_engagement_rate,
    ROUND(MAX(engagement_rate), 4) AS max_source_engagement_rate,
    ROUND(AVG(engagement_rate_calc), 4) AS avg_calculated_engagement_rate,
    ROUND(MIN(engagement_rate_calc), 4) AS min_calculated_engagement_rate,
    ROUND(MAX(engagement_rate_calc), 4) AS max_calculated_engagement_rate
FROM instagram_posts;

-- 2.9 Date Coverage
-- Question: What period does the dataset cover?
-- What period does the dataset cover?

SELECT
    MIN(post_date) AS earliest_post_date,
    MAX(post_date) AS latest_post_date,
    DATEDIFF(MAX(post_date), MIN(post_date)) + 1 AS days_covered
FROM instagram_posts;

-- 3. MEDIA TYPE ANALYSIS

-- 3.1 Post Volume
-- Which media types are posted most frequently?

SELECT
    media_type,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY media_type
ORDER BY total_posts DESC;

-- 3.2 Average Engagement
-- Which media types generate the highest average engagement?

SELECT
    media_type,
    COUNT(*) AS total_posts,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts
GROUP BY media_type
ORDER BY avg_total_engagement DESC;

-- 3.3 Reach & Impressions
-- Which media types generate the highest average reach and impressions?

SELECT
    media_type,
    COUNT(*) AS total_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(impressions), 2) AS avg_impressions
FROM instagram_posts
GROUP BY media_type
ORDER BY avg_reach DESC;

-- 3.4 Follower Growth
-- Which media types generate the most follower growth?

SELECT
    media_type,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY media_type
ORDER BY avg_followers_gained DESC;

-- 3.5 Engagement Rate
-- Which media types have the highest engagement rate?

SELECT
    media_type,
    COUNT(*) AS total_posts,
    ROUND(AVG(engagement_rate_calc), 2) AS avg_engagement_rate
FROM instagram_posts
GROUP BY media_type
ORDER BY avg_engagement_rate DESC;

-- 4. CONTENT CATEGORY ANALYSIS

-- 4.1 Post Volume
-- Which content categories are posted most frequently?

SELECT
    content_category,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY content_category
ORDER BY total_posts DESC;

-- 4.2 Average Engagement
-- Which content categories generate the highest average engagement?

SELECT
    content_category,
    COUNT(*) AS total_posts,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts
GROUP BY content_category
ORDER BY avg_total_engagement DESC;

-- 4.3 Reach & Impressions
-- Which content categories generate the highest average reach and impressions?

SELECT
    content_category,
    COUNT(*) AS total_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(impressions), 2) AS avg_impressions
FROM instagram_posts
GROUP BY content_category
ORDER BY avg_reach DESC;

-- 4.4 Follower Growth
-- Which content categories generate the most follower growth?

SELECT
    content_category,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY content_category
ORDER BY avg_followers_gained DESC;

-- 4.5 Engagement Rate
-- Which content categories have the highest engagement rate?

SELECT
    content_category,
    COUNT(*) AS total_posts,
    ROUND(AVG(engagement_rate_calc), 2) AS avg_engagement_rate
FROM instagram_posts
GROUP BY content_category
ORDER BY avg_engagement_rate DESC;

-- 5. POSTING TIME ANALYSIS

-- 5.1 Post Volume by Hour
-- Which posting hours have the highest number of posts?

SELECT
    post_hour,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY post_hour
ORDER BY total_posts DESC;

-- 5.2 Average Engagement by Hour
-- Which posting hours generate the highest average engagement?

SELECT
    post_hour,
    COUNT(*) AS total_posts,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts
GROUP BY post_hour
ORDER BY avg_total_engagement DESC;

-- 5.3 Reach & Impressions by Hour
-- Which posting hours generate the highest average reach and impressions?

SELECT
    post_hour,
    COUNT(*) AS total_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(impressions), 2) AS avg_impressions
FROM instagram_posts
GROUP BY post_hour
ORDER BY avg_reach DESC;

-- 5.4 Follower Growth by Hour
-- Which posting hours generate the most follower growth?

SELECT
    post_hour,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY post_hour
ORDER BY avg_followers_gained DESC;

-- 5.5 Engagement Rate by Hour
-- Which posting hours have the highest engagement rate?

SELECT
    post_hour,
    COUNT(*) AS total_posts,
    ROUND(AVG(engagement_rate_calc), 2) AS avg_engagement_rate
FROM instagram_posts
GROUP BY post_hour
ORDER BY avg_engagement_rate DESC;

-- ============================================
-- 6. TRAFFIC SOURCE ANALYSIS
-- ============================================

-- 6.1 Post Volume
-- Which traffic sources generate the most posts?

SELECT
    traffic_source,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY traffic_source
ORDER BY total_posts DESC;

-- 6.2 Average Engagement
-- Which traffic sources generate the highest average engagement?

SELECT
    traffic_source,
    COUNT(*) AS total_posts,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts
GROUP BY traffic_source
ORDER BY avg_total_engagement DESC;

-- 6.3 Reach & Impressions
-- Which traffic sources generate the highest average reach and impressions?

SELECT
    traffic_source,
    COUNT(*) AS total_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(impressions), 2) AS avg_impressions
FROM instagram_posts
GROUP BY traffic_source
ORDER BY avg_reach DESC;

-- 6.4 Engagement Rate
-- Which traffic sources have the highest engagement rate?

SELECT
    traffic_source,
    COUNT(*) AS total_posts,
    ROUND(AVG(engagement_rate_calc), 2) AS avg_engagement_rate
FROM instagram_posts
GROUP BY traffic_source
ORDER BY avg_engagement_rate DESC;

-- ============================================
-- 7. CTA ANALYSIS
-- ============================================

-- 7.1 CTA Usage
-- How many posts use a call-to-action?

SELECT
    has_call_to_action,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY has_call_to_action
ORDER BY total_posts DESC;

-- 7.2 Average Engagement
-- Do posts with CTAs generate higher average engagement?

SELECT
    has_call_to_action,
    COUNT(*) AS total_posts,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts
GROUP BY has_call_to_action
ORDER BY avg_total_engagement DESC;

-- 7.3 Reach & Impressions
-- Do posts with CTAs generate higher average reach and impressions?

SELECT
    has_call_to_action,
    COUNT(*) AS total_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(impressions), 2) AS avg_impressions
FROM instagram_posts
GROUP BY has_call_to_action
ORDER BY avg_reach DESC;

-- 7.4 Engagement Rate
-- Do posts with CTAs have a higher engagement rate?

SELECT
    has_call_to_action,
    COUNT(*) AS total_posts,
    ROUND(AVG(engagement_rate_calc), 2) AS avg_engagement_rate
FROM instagram_posts
GROUP BY has_call_to_action
ORDER BY avg_engagement_rate DESC;

-- ============================================
-- 8. AUDIENCE GROWTH ANALYSIS
-- ============================================

-- 8.1 Follower Growth by Media Type
-- Which media types generate the most follower growth?

SELECT
    media_type,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY media_type
ORDER BY avg_followers_gained DESC;

-- 8.2 Follower Growth by Content Category
-- Which content categories generate the most follower growth?

SELECT
    content_category,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY content_category
ORDER BY avg_followers_gained DESC;

-- 8.3 Follower Growth by Traffic Source
-- Which traffic sources generate the most follower growth?

SELECT
    traffic_source,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY traffic_source
ORDER BY avg_followers_gained DESC;

-- 8.4 Follower Growth by Posting Hour
-- Which posting hours generate the most follower growth?

SELECT
    post_hour,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY post_hour
ORDER BY avg_followers_gained DESC;

-- ============================================
-- 9. ENGAGEMENT & TOP POST ANALYSIS
-- ============================================

-- 9.1 Top Posts by Total Engagement
-- Which posts generated the highest total engagement?

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    likes,
    comments,
    shares,
    saves,
    total_engagement
FROM instagram_posts
ORDER BY total_engagement DESC
LIMIT 10;

-- 9.2 Top Posts by Reach
-- Which posts reached the largest audiences?

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    reach,
    impressions,
    total_engagement
FROM instagram_posts
ORDER BY reach DESC
LIMIT 10;

-- 9.3 Top Posts by Engagement Rate
-- Which posts had the highest engagement rate?

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    reach,
    total_engagement,
    ROUND(engagement_rate_calc, 2) AS engagement_rate
FROM instagram_posts
ORDER BY engagement_rate_calc DESC
LIMIT 10;

-- 9.4 Top Posts by Follower Growth
-- Which posts generated the most new followers?

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    followers_gained,
    total_engagement,
    reach
FROM instagram_posts
ORDER BY followers_gained DESC
LIMIT 10;

-- 9.5 Engagement Type Breakdown
-- What types of engagement are most common among top-performing posts?

SELECT
    post_id,
    media_type,
    content_category,
    likes,
    comments,
    shares,
    saves
FROM instagram_posts
ORDER BY total_engagement DESC
LIMIT 10;

-- ============================================
-- 10. PERFORMANCE BUCKET ANALYSIS
-- ============================================

-- 10.1 Performance Distribution
-- How are posts distributed across performance buckets?

SELECT
    performance_bucket_label,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY performance_bucket_label
ORDER BY total_posts DESC;

-- 10.2 Engagement by Performance Bucket
-- How does engagement differ across performance buckets?

SELECT
    performance_bucket_label,
    COUNT(*) AS total_posts,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts
GROUP BY performance_bucket_label
ORDER BY avg_total_engagement DESC;

-- 10.3 Reach & Impressions by Performance Bucket
-- How does visibility differ across performance buckets?

SELECT
    performance_bucket_label,
    COUNT(*) AS total_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(impressions), 2) AS avg_impressions
FROM instagram_posts
GROUP BY performance_bucket_label
ORDER BY avg_reach DESC;

-- 10.4 Follower Growth by Performance Bucket
-- How does follower growth differ across performance buckets?

SELECT
    performance_bucket_label,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY performance_bucket_label
ORDER BY avg_followers_gained DESC;

-- ============================================
-- 11. ACCOUNT-LEVEL ANALYSIS
-- ============================================

-- 11.1 Post Volume by Account
-- Which accounts have the most posts?

SELECT
    account_id,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY account_id
ORDER BY total_posts DESC;

-- 11.2 Average Engagement by Account
-- Which accounts generate the highest average engagement?

SELECT
    account_id,
    COUNT(*) AS total_posts,
    ROUND(AVG(total_engagement), 2) AS avg_total_engagement
FROM instagram_posts
GROUP BY account_id
ORDER BY avg_total_engagement DESC;

-- 11.3 Reach & Impressions by Account
-- Which accounts achieve the highest average reach and impressions?

SELECT
    account_id,
    COUNT(*) AS total_posts,
    ROUND(AVG(reach), 2) AS avg_reach,
    ROUND(AVG(impressions), 2) AS avg_impressions
FROM instagram_posts
GROUP BY account_id
ORDER BY avg_reach DESC;

-- 11.4 Follower Growth by Account
-- Which accounts generate the most follower growth?

SELECT
    account_id,
    COUNT(*) AS total_posts,
    ROUND(AVG(followers_gained), 2) AS avg_followers_gained,
    SUM(followers_gained) AS total_followers_gained
FROM instagram_posts
GROUP BY account_id
ORDER BY avg_followers_gained DESC;

-- 11.5 Engagement Rate by Account
-- Which accounts have the highest average engagement rate?

SELECT
    account_id,
    COUNT(*) AS total_posts,
    ROUND(AVG(engagement_rate_calc), 2) AS avg_engagement_rate
FROM instagram_posts
GROUP BY account_id
ORDER BY avg_engagement_rate DESC;

   12. ADVANCED SQL ANALYSIS
   ============================================================ */

   12.1 CASE WHEN ANALYSIS
   ============================================================ */

SELECT
    post_id,
    total_engagement,
    CASE
        WHEN total_engagement < 200 THEN 'Low'
        WHEN total_engagement < 500 THEN 'Medium'
        ELSE 'High'
    END AS engagement_level
FROM instagram_posts;

SELECT
    CASE
        WHEN total_engagement < 200 THEN 'Low'
        WHEN total_engagement < 500 THEN 'Medium'
        ELSE 'High'
    END AS engagement_level,
    COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY engagement_level
ORDER BY total_posts DESC;

SELECT
    media_type,
    COUNT(*) AS high_engagement_posts
FROM instagram_posts
WHERE total_engagement >= 500
GROUP BY media_type
ORDER BY high_engagement_posts DESC;

SELECT
    content_category,
    COUNT(*) AS high_engagement_posts
FROM instagram_posts
WHERE total_engagement >= 500
GROUP BY content_category
ORDER BY high_engagement_posts DESC;

SELECT
    account_id,
    COUNT(*) AS high_engagement_posts
FROM instagram_posts
WHERE total_engagement >= 500
GROUP BY account_id
ORDER BY high_engagement_posts DESC;

   12.2 SUBQUERY ANALYSIS
   ============================================================ */

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement
FROM instagram_posts
WHERE total_engagement > (
    SELECT AVG(total_engagement)
    FROM instagram_posts
)
ORDER BY total_engagement DESC;

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    likes,
    comments,
    shares,
    saves,
    reach
FROM instagram_posts
WHERE reach > (
    SELECT AVG(reach)
    FROM instagram_posts
)
ORDER BY reach DESC;

SELECT
    account_id,
    ROUND(AVG(total_engagement), 2) AS avg_account_engagement
FROM instagram_posts
GROUP BY account_id
HAVING AVG(total_engagement) > (
    SELECT AVG(total_engagement)
    FROM instagram_posts
)
ORDER BY avg_account_engagement DESC;

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    ROUND(engagement_rate_calc, 2) AS engagement_rate
FROM instagram_posts
WHERE engagement_rate_calc > (
    SELECT AVG(engagement_rate_calc)
    FROM instagram_posts
)
ORDER BY engagement_rate DESC;

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    followers_gained
FROM instagram_posts
WHERE followers_gained > (
    SELECT AVG(followers_gained)
    FROM instagram_posts
)
ORDER BY followers_gained DESC;

   12.3 CTE ANALYSIS
   ============================================================ */

WITH account_performance AS (
    SELECT
        account_id,
        COUNT(*) AS total_posts,
        AVG(total_engagement) AS avg_engagement
    FROM instagram_posts
    GROUP BY account_id
)

SELECT
    account_id,
    total_posts,
    ROUND(avg_engagement, 2) AS avg_engagement
FROM account_performance
WHERE avg_engagement > (
    SELECT AVG(total_engagement)
    FROM instagram_posts
)
ORDER BY avg_engagement DESC;

WITH media_performance AS (
    SELECT
        media_type,
        COUNT(*) AS total_posts,
        AVG(total_engagement) AS avg_engagement
    FROM instagram_posts
    GROUP BY media_type
)

SELECT
    media_type,
    total_posts,
    ROUND(avg_engagement, 2) AS avg_engagement
FROM media_performance
WHERE avg_engagement > (
    SELECT AVG(total_engagement)
    FROM instagram_posts
)
ORDER BY avg_engagement DESC;

WITH category_performance AS (
    SELECT
        content_category,
        COUNT(*) AS total_posts,
        AVG(total_engagement) AS avg_engagement,
        AVG(followers_gained) AS avg_followers_gained
    FROM instagram_posts
    GROUP BY content_category
)

SELECT
    content_category,
    total_posts,
    ROUND(avg_engagement, 2) AS avg_engagement,
    ROUND(avg_followers_gained, 2) AS avg_followers_gained
FROM category_performance
WHERE avg_engagement > (
    SELECT AVG(total_engagement)
    FROM instagram_posts
)
AND avg_followers_gained > (
    SELECT AVG(followers_gained)
    FROM instagram_posts
)
ORDER BY avg_engagement DESC;

WITH hourly_performance AS (
    SELECT
        post_hour,
        COUNT(*) AS total_posts,
        AVG(total_engagement) AS avg_engagement,
        AVG(followers_gained) AS avg_followers_gained
    FROM instagram_posts
    GROUP BY post_hour
)

SELECT
    post_hour,
    total_posts,
    ROUND(avg_engagement, 2) AS avg_engagement,
    ROUND(avg_followers_gained, 2) AS avg_followers_gained
FROM hourly_performance
WHERE avg_engagement > (
    SELECT AVG(total_engagement)
    FROM instagram_posts
)
AND avg_followers_gained > (
    SELECT AVG(followers_gained)
    FROM instagram_posts
)
ORDER BY avg_engagement DESC;

WITH content_performance AS (
    SELECT
        media_type,
        content_category,
        COUNT(*) AS total_posts,
        AVG(total_engagement) AS avg_engagement,
        AVG(engagement_rate_calc) AS avg_engagement_rate
    FROM instagram_posts
    GROUP BY media_type, content_category
)

SELECT
    media_type,
    content_category,
    total_posts,
    ROUND(avg_engagement, 2) AS avg_engagement,
    ROUND(avg_engagement_rate, 2) AS avg_engagement_rate
FROM content_performance
ORDER BY avg_engagement DESC;

   12.4 WINDOW FUNCTION ANALYSIS
   ============================================================ */

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    RANK() OVER (
        ORDER BY total_engagement DESC
    ) AS engagement_rank
FROM instagram_posts
ORDER BY engagement_rank;

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    RANK() OVER (
        PARTITION BY account_id
        ORDER BY total_engagement DESC
    ) AS account_engagement_rank
FROM instagram_posts
ORDER BY account_id, account_engagement_rank;

SELECT
    post_id,
    media_type,
    content_category,
    total_engagement,
    RANK() OVER (
        PARTITION BY media_type
        ORDER BY total_engagement DESC
    ) AS media_type_engagement_rank
FROM instagram_posts
ORDER BY media_type, media_type_engagement_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY total_engagement DESC
        ) AS post_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    post_rank
FROM ranked_posts
WHERE post_rank <= 3
ORDER BY account_id, post_rank;

SELECT
    post_id,
    account_id,
    media_type,
    total_engagement,
    ROUND(
        AVG(total_engagement) OVER (
            PARTITION BY account_id
        ), 2
    ) AS account_avg_engagement
FROM instagram_posts
ORDER BY account_id, total_engagement DESC;

   12.5 RANK(), ROW_NUMBER() & PARTITION BY
   ============================================================ */

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    RANK() OVER (
        ORDER BY total_engagement DESC
    ) AS engagement_rank
FROM instagram_posts
ORDER BY engagement_rank
LIMIT 5;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY total_engagement DESC
        ) AS post_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    post_rank
FROM ranked_posts
WHERE post_rank <= 5
ORDER BY account_id, post_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        media_type,
        content_category,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY media_type
            ORDER BY total_engagement DESC
        ) AS media_rank
    FROM instagram_posts
)

SELECT
    post_id,
    media_type,
    content_category,
    total_engagement,
    media_rank
FROM ranked_posts
WHERE media_rank <= 3
ORDER BY media_type, media_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        content_category,
        media_type,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY content_category
            ORDER BY total_engagement DESC
        ) AS category_rank
    FROM instagram_posts
)

SELECT
    post_id,
    content_category,
    media_type,
    total_engagement,
    category_rank
FROM ranked_posts
WHERE category_rank <= 3
ORDER BY content_category, category_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        reach,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY reach DESC
        ) AS reach_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    reach,
    total_engagement,
    reach_rank
FROM ranked_posts
WHERE reach_rank <= 3
ORDER BY account_id, reach_rank;

   12.6 ROW_NUMBER() ANALYSIS
   ============================================================ */

SELECT
    post_id,
    account_id,
    media_type,
    total_engagement,
    ROW_NUMBER() OVER (
        ORDER BY total_engagement DESC
    ) AS engagement_row_number
FROM instagram_posts
ORDER BY engagement_row_number;

SELECT
    post_id,
    account_id,
    media_type,
    total_engagement,
    ROW_NUMBER() OVER (
        PARTITION BY account_id
        ORDER BY total_engagement DESC
    ) AS account_row_number
FROM instagram_posts
ORDER BY account_id, account_row_number;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY total_engagement DESC
        ) AS row_num
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement
FROM ranked_posts
WHERE row_num = 1
ORDER BY account_id;

WITH latest_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        post_datetime,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY post_datetime DESC
        ) AS row_num
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    post_datetime
FROM latest_posts
WHERE row_num = 1
ORDER BY account_id;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        reach,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY reach DESC
        ) AS row_num
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    reach,
    total_engagement
FROM ranked_posts
WHERE row_num = 1
ORDER BY account_id;

   12.7 PARTITION BY ANALYSIS
   ============================================================ */

SELECT
    post_id,
    account_id,
    total_engagement,
    ROUND(
        AVG(total_engagement) OVER (
            PARTITION BY account_id
        ), 2
    ) AS account_avg_engagement
FROM instagram_posts;

SELECT
    post_id,
    account_id,
    reach,
    ROUND(
        AVG(reach) OVER (
            PARTITION BY account_id
        ), 2
    ) AS account_avg_reach
FROM instagram_posts;

SELECT
    post_id,
    account_id,
    total_engagement,
    SUM(total_engagement) OVER (
        PARTITION BY account_id
    ) AS account_total_engagement
FROM instagram_posts;

SELECT
    post_id,
    account_id,
    COUNT(*) OVER (
        PARTITION BY account_id
    ) AS account_post_count
FROM instagram_posts;

SELECT
    post_id,
    account_id,
    total_engagement,
    ROUND(
        AVG(total_engagement) OVER (
            PARTITION BY account_id
        ), 2
    ) AS account_avg_engagement
FROM instagram_posts;

   12.8 TOP-N ANALYSIS
   ============================================================ */

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        total_engagement,
        ROW_NUMBER() OVER (
            ORDER BY total_engagement DESC
        ) AS post_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    post_rank
FROM ranked_posts
WHERE post_rank <= 10
ORDER BY post_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY total_engagement DESC
        ) AS post_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    post_rank
FROM ranked_posts
WHERE post_rank <= 3
ORDER BY account_id, post_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        media_type,
        content_category,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY media_type
            ORDER BY total_engagement DESC
        ) AS post_rank
    FROM instagram_posts
)

SELECT
    post_id,
    media_type,
    content_category,
    total_engagement,
    post_rank
FROM ranked_posts
WHERE post_rank <= 3
ORDER BY media_type, post_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        content_category,
        media_type,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY content_category
            ORDER BY total_engagement DESC
        ) AS post_rank
    FROM instagram_posts
)

SELECT
    post_id,
    content_category,
    media_type,
    total_engagement,
    post_rank
FROM ranked_posts
WHERE post_rank <= 3
ORDER BY content_category, post_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        reach,
        total_engagement,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY reach DESC
        ) AS reach_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    reach,
    total_engagement,
    reach_rank
FROM ranked_posts
WHERE reach_rank <= 3
ORDER BY account_id, reach_rank;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        reach,
        total_engagement,
        engagement_rate_calc,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY engagement_rate_calc DESC
        ) AS rate_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    reach,
    total_engagement,
    ROUND(engagement_rate_calc, 2) AS engagement_rate,
    rate_rank
FROM ranked_posts
WHERE rate_rank <= 3
ORDER BY account_id, rate_rank;

   12.9 ADVANCED BUSINESS QUESTIONS
   ============================================================ */

WITH post_performance AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        total_engagement,
        ROUND(
            AVG(total_engagement) OVER (
                PARTITION BY account_id
            ), 2
        ) AS account_avg_engagement
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    account_avg_engagement,
    ROUND(
        total_engagement - account_avg_engagement, 2
    ) AS engagement_above_average
FROM post_performance
WHERE total_engagement > account_avg_engagement
ORDER BY engagement_above_average DESC;

WITH media_performance AS (
    SELECT
        media_type,
        COUNT(*) AS total_posts,
        AVG(total_engagement) AS avg_engagement,
        AVG(reach) AS avg_reach,
        AVG(engagement_rate_calc) AS avg_engagement_rate
    FROM instagram_posts
    GROUP BY media_type
)

SELECT
    media_type,
    total_posts,
    ROUND(avg_engagement, 2) AS avg_engagement,
    ROUND(avg_reach, 2) AS avg_reach,
    ROUND(avg_engagement_rate, 2) AS avg_engagement_rate
FROM media_performance
ORDER BY avg_engagement DESC;

WITH benchmarks AS (
    SELECT
        AVG(total_engagement) AS avg_engagement,
        AVG(reach) AS avg_reach
    FROM instagram_posts
)

SELECT
    p.post_id,
    p.account_id,
    p.media_type,
    p.content_category,
    p.total_engagement,
    p.reach
FROM instagram_posts p
CROSS JOIN benchmarks b
WHERE p.total_engagement > b.avg_engagement
AND p.reach < b.avg_reach
ORDER BY p.total_engagement DESC;

WITH benchmarks AS (
    SELECT
        AVG(total_engagement) AS avg_engagement,
        AVG(reach) AS avg_reach
    FROM instagram_posts
)

SELECT
    p.post_id,
    p.account_id,
    p.media_type,
    p.content_category,
    p.total_engagement,
    p.reach,
    ROUND(p.engagement_rate_calc, 2) AS engagement_rate
FROM instagram_posts p
CROSS JOIN benchmarks b
WHERE p.total_engagement > b.avg_engagement
AND p.reach > b.avg_reach
ORDER BY p.total_engagement DESC;

WITH ranked_posts AS (
    SELECT
        post_id,
        account_id,
        media_type,
        content_category,
        total_engagement,
        reach,
        engagement_rate_calc,
        ROW_NUMBER() OVER (
            PARTITION BY account_id
            ORDER BY total_engagement DESC
        ) AS post_rank
    FROM instagram_posts
)

SELECT
    post_id,
    account_id,
    media_type,
    content_category,
    total_engagement,
    reach,
    ROUND(engagement_rate_calc, 2) AS engagement_rate
FROM ranked_posts
WHERE post_rank = 1
ORDER BY total_engagement DESC;
