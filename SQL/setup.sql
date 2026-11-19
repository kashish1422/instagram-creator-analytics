-- Instagram Creator Analytics
-- MySQL setup: create the database and table, then load the cleaned dataset.
-- Run this once before analysis.sql.

CREATE DATABASE IF NOT EXISTS instagram_creator_analytics;
USE instagram_creator_analytics;

DROP TABLE IF EXISTS instagram_posts;

CREATE TABLE instagram_posts (
    post_id                  VARCHAR(20)   NOT NULL PRIMARY KEY,
    account_id               INT           NOT NULL,
    account_type             VARCHAR(20)   NOT NULL,
    follower_count           INT           NOT NULL,
    media_type               VARCHAR(20)   NOT NULL,
    content_category         VARCHAR(30)   NOT NULL,
    traffic_source           VARCHAR(30)   NOT NULL,
    has_call_to_action       TINYINT       NOT NULL,
    post_datetime            DATETIME      NOT NULL,
    post_date                DATE          NOT NULL,
    post_hour                TINYINT       NOT NULL,
    day_of_week              VARCHAR(10)   NOT NULL,
    likes                    INT           NOT NULL,
    comments                 INT           NOT NULL,
    shares                   INT           NOT NULL,
    saves                    INT           NOT NULL,
    reach                    INT           NOT NULL,
    impressions              INT           NOT NULL,
    engagement_rate          DECIMAL(8,4)  NOT NULL,
    followers_gained         INT           NOT NULL,
    caption_length           INT           NOT NULL,
    hashtags_count           INT           NOT NULL,
    performance_bucket_label VARCHAR(10)   NOT NULL,
    total_engagement         INT           NOT NULL,
    engagement_rate_calc     DOUBLE        NOT NULL
);

-- Update the path below to where the repository lives on your machine.
-- Requires local_infile to be enabled on both the MySQL client and server.
LOAD DATA LOCAL INFILE 'Data/Cleaned/instagram_creator_cleaned.csv'
INTO TABLE instagram_posts
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Validation: expect 29,999 rows and 20 accounts.
SELECT COUNT(*) AS total_posts, COUNT(DISTINCT account_id) AS total_accounts
FROM instagram_posts;
