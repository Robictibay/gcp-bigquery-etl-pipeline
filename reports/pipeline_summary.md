\# Phase 3 Pipeline Summary



\## Project



This project demonstrates a beginner cloud data engineering workflow using Python, Google Cloud Storage, BigQuery, and SQL analytics.



\## Pipeline Flow



1\. Generate synthetic transaction data with Python.

2\. Save raw transaction data as CSV.

3\. Clean and transform the transaction dataset.

4\. Upload the processed CSV to Google Cloud Storage.

5\. Load the processed dataset into a BigQuery table.

6\. Run SQL analytics queries for KPI reporting and anomaly detection.



\## Dataset



The dataset is synthetic and portfolio-safe. It contains 5,150 transaction records with the following fields:



\- transaction\_id

\- transaction\_date

\- client\_id

\- category

\- status

\- amount

\- is\_success

\- is\_failed

\- is\_refunded



A clear anomaly was intentionally injected:



\- Date: 2026-03-15

\- Client: Client\_1004

\- Category: E-commerce

\- Daily transaction count: 151



\## Cloud Resources



\- GCP Project: rafael-phase3-etl-2026

\- Region: asia-southeast1

\- Cloud Storage Bucket: rafael-phase3-etl-2026-etl-bucket

\- BigQuery Dataset: phase3\_etl

\- BigQuery Table: transactions



\## Analytics Outputs



The project includes SQL queries for:



\- Total successful revenue

\- Failed transaction rate

\- Refund transaction rate

\- Revenue by category

\- Top clients by transaction volume

\- Daily transaction anomaly detection



\## Portfolio Value



This project shows practical experience with:



\- ETL pipeline design

\- Cloud Storage

\- BigQuery loading

\- SQL analytics

\- Data cleaning

\- Business KPI reporting

\- Anomaly detection

\- Command-line cloud workflows

