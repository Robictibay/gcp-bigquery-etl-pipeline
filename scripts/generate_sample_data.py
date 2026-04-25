import pandas as pd
import random
from datetime import datetime, timedelta
from pathlib import Path

random.seed(42)

Path("data/raw").mkdir(parents=True, exist_ok=True)

clients = [f"Client_{i}" for i in range(1001, 1011)]
categories = ["E-commerce", "Bills Payment", "Bank Transfer", "Subscription", "Retail"]
statuses = ["success", "failed", "refunded"]

rows = []
start_date = datetime(2026, 1, 1)

for i in range(5000):
    tx_date = start_date + timedelta(days=random.randint(0, 119))
    client = random.choice(clients)
    category = random.choice(categories)
    status = random.choices(statuses, weights=[0.88, 0.08, 0.04])[0]
    amount = round(random.uniform(100, 10000), 2)

    rows.append({
        "transaction_id": f"TXN-{i+1:06d}",
        "transaction_date": tx_date.date().isoformat(),
        "client_id": client,
        "category": category,
        "status": status,
        "amount": amount
    })

# Inject clear anomaly for the portfolio story
for i in range(150):
    rows.append({
        "transaction_id": f"ANOM-{i+1:06d}",
        "transaction_date": "2026-03-15",
        "client_id": "Client_1004",
        "category": "E-commerce",
        "status": "success",
        "amount": round(random.uniform(500, 15000), 2)
    })

df = pd.DataFrame(rows)
df.to_csv("data/raw/transactions_raw.csv", index=False)

print("Created data/raw/transactions_raw.csv")
print(df.head())
print(f"Rows: {len(df)}")