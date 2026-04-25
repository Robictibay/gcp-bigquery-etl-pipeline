$PROJECT_ID="rafael-phase3-etl-2026"
$REGION="asia-southeast1"
$BUCKET_NAME="$PROJECT_ID-etl-bucket"
$DATASET_ID="phase3_etl"

Write-Host "Starting Phase 3 ETL pipeline..."

Write-Host "Step 1: Generate sample raw transaction data"
python scripts\generate_sample_data.py

Write-Host "Step 2: Clean and transform transaction data"
python scripts\transform.py

Write-Host "Step 3: Upload processed CSV to Google Cloud Storage"
gcloud storage cp data/processed/transactions_clean.csv gs://$BUCKET_NAME/processed/transactions_clean.csv

Write-Host "Step 4: Confirm uploaded file"
gcloud storage ls gs://$BUCKET_NAME/processed/

Write-Host "Step 5: Load processed CSV into BigQuery"
bq --location=$REGION load --replace --autodetect --source_format=CSV "${PROJECT_ID}:${DATASET_ID}.transactions" "gs://$BUCKET_NAME/processed/transactions_clean.csv"

Write-Host "Step 6: Preview BigQuery table"
bq head -n 5 "${PROJECT_ID}:${DATASET_ID}.transactions"

Write-Host "Pipeline complete."