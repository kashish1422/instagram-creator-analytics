### 1. Project Scope

#### 1.1 In Scope

- Data collection/selection
- Data understanding
- Data cleaning
- Exploratory Data Analysis
- SQL analysis
- KPI calculation
- Engagement analysis
- Content performance analysis
- Follower growth analysis
- Posting pattern analysis
- Statistical relationship analysis
- Interactive dashboard
- Business insights
- Recommendations
- Project documentation

#### 1.2 Out of Scope
The first version will not include:

- Instagram API integration
- Real-time tracking
- Machine learning prediction
- Automated posting
- Sentiment analysis
- Web scraping
- AI-generated content recommendations

These may be considered for a future version.

## 2. Project Architecture

The project will follow an end-to-end data analytics workflow:

### 2.1. Data Layer

* Instagram creator dataset
* Raw data storage
* Data dictionary

### 2.2. Data Cleaning Layer

* Handle missing values
* Remove duplicates
* Correct data types
* Validate data
* Create calculated columns
* Prepare analysis-ready data

### 2.3. Database Layer

* Store cleaned data in MySQL
* Create database tables
* Write SQL queries
* Perform aggregations and filtering

### 2.4. Analysis Layer

* Exploratory Data Analysis using Python
* Analyze follower growth
* Analyze engagement
* Compare content types
* Analyze reach and views
* Analyze posting patterns
* Calculate KPIs
* Identify relationships and trends

### 2.5. Visualization Layer

* Create charts using Python
* Build an interactive Power BI dashboard
* Present KPIs and performance trends

### 2.6. Business Insights Layer

* Identify important findings
* Explain performance patterns
* Identify areas of opportunity
* Provide data-driven recommendations

### 2.7. Documentation Layer

* Business understanding
* Data requirements
* Data cleaning process
* SQL analysis
* Python analysis
* Dashboard documentation
* Final insights and recommendations

### Overall Workflow

```text
Raw Instagram Data
        ↓
Data Cleaning & Validation
        ↓
MySQL Database
        ↓
SQL Analysis
        ↓
Python EDA & KPI Analysis
        ↓
Power BI Dashboard
        ↓
Business Insights
        ↓
Recommendations
        ↓
Final Project Documentation
```
### 3. Technology Stack

#### Data Analysis
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn

#### Database

- MySQL
- SQL

#### Dashboard

- Power BI

#### Development

- VS Code
- Jupyter Notebook

#### Version Control

- Git
- GitHub

### 4. Expected Outcomes

At the end of the project, we should be able to:
- Understand the creator's historical performance.
- Identify high-performing content.
- Compare content formats.
- Analyze engagement patterns.
- Analyze follower growth.
- Identify useful posting patterns.
- Calculate and monitor important KPIs.
- Present findings through an interactive dashboard.
- Translate analytical findings into business insights and recommendations.

### 5. Project Constraints

This is a portfolio project, so the first version will prioritize:
- Clear business questions
- Clean and reliable analysis
- Meaningful KPIs
- Strong visualizations
- Useful business insights
- Professional documentation

The project will prioritize quality over unnecessary complexity.

### 6. Dataset Selection Rule

The dataset must be evaluated against the business questions before analysis begins.

We will not:
- Force a dataset to answer unsupported questions.
- Invent missing metrics.
- Create fake Instagram data without clearly labeling it as synthetic.
- Add unnecessary features simply to make the project look larger.

If the selected dataset has limitations, the project scope will be adjusted accordingly.