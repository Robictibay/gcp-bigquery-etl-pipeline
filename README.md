# GCP BigQuery ETL Pipeline

A beginner cloud data engineering project — Python-generated transaction data, cleaned and pushed through GCS into BigQuery for SQL-based KPI reporting and anomaly detection.

---

## Overview

This project simulates a lightweight ETL pipeline for business transaction data. The data is synthetic and portfolio-safe — no real client or financial records involved.

The pipeline goes:

```text
Python data generation → cleaning/transformation → GCS upload → BigQuery load → SQL analytics
```

---

## Stack

Python · pandas · Google Cloud Storage · BigQuery · SQL · gcloud CLI · bq CLI · PowerShell

---

## Project Structure

```text
gcp-bigquery-etl-pipeline/
├── data/
│   ├── raw/
│   └── processed/
├── reports/
│   └── pipeline_summary.md
├── screenshots/
├── scripts/
│   ├── generate_sample_data.py
│   ├── transform.py
│   └── run_pipeline.ps1
├── sql/
│   ├── kpi_queries.sql
│   └── anomaly_queries.sql
├── README.md
├── DEVLOG.txt
├── requirements.txt
└── .gitignore
```

---

## Dataset

5,150 synthetic transaction records with these fields: `transaction_id`, `transaction_date`, `client_id`, `category`, `status`, `amount`, `is_success`, `is_failed`, `is_refunded`.

One anomaly was intentionally injected — **Client_1004**, E-commerce category, **2026-03-15**, with a daily transaction count of 151 — to validate the detection query.

---

## SQL Analytics

- Total successful revenue
- Failed and refund transaction rates
- Revenue by category
- Top clients by transaction volume
- Daily anomaly detection

**Anomaly query result:**

| transaction_date | client_id   | category   | daily_transaction_count |
|------------------|-------------|------------|--------------------------|
| 2026-03-15       | Client_1004 | E-commerce | 151                      |

---

## How to Run

```powershell
# Activate environment
.\venv\Scripts\activate

# Set variables
$PROJECT_ID="rafael-phase3-etl-2026"
$REGION="asia-southeast1"
$BUCKET_NAME="$PROJECT_ID-etl-bucket"
$DATASET_ID="phase3_etl"

# Run pipeline
.\scripts\run_pipeline.ps1

# Preview BigQuery table
bq head -n 5 "${PROJECT_ID}:${DATASET_ID}.transactions"
```

---

## Status

- [x] Generated synthetic transaction data
- [x] Cleaned and transformed CSV
- [x] Uploaded to Google Cloud Storage
- [x] Loaded into BigQuery
- [x] Ran KPI queries
- [x] Ran anomaly detection
- [ ] Screenshots
- [ ] Power BI dashboard (planned)