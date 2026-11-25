import pandas as pd

df = pd.read_csv("practice_vendor_payments.csv")

# Check duplicate rows
print("Duplicate rows:", df.duplicated().sum())

# Remove duplicate rows
df = df.drop_duplicates()

# Convert date columns into datetime format
df["payment_date"] = pd.to_datetime(df["payment_date"])
df["due_date"] = pd.to_datetime(df["due_date"])

# Check the cleaned dataset
print("\nCleaned shape:", df.shape)
print("\nUpdated data types:")
print(df.dtypes)

# Save cleaned dataset
df.to_csv("cleaned_payments.csv", index=False)

print("\nCleaned dataset saved!")