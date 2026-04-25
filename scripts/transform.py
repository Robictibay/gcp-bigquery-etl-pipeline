import pandas as pd
from pathlib import Path

Path("data/processed").mkdir(parents=True, exist_ok=True)

df = pd.read_csv("data/raw/transactions_raw.csv")

df["transaction_date"] = pd.to_datetime(df["transaction_date"])
df["amount"] = pd.to_numeric(df["amount"], errors="coerce")

df = df.dropna(subset=[
    "transaction_id",
    "transaction_date",
    "client_id",
    "category",
    "status",
    "amount"
])

df["is_success"] = df["status"].eq("success")
df["is_failed"] = df["status"].eq("failed")
df["is_refunded"] = df["status"].eq("refunded")

df.to_csv("data/processed/transactions_clean.csv", index=False)

print("Created data/processed/transactions_clean.csv")
print(df.head())
print(f"Rows after cleaning: {len(df)}")