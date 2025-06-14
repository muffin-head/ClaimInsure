from google.cloud import storage

# Initialize client
client = storage.Client(project="behavior-based-claim")

# Define bucket and blob
bucket_name = 'behavior-based-claim-severity-data'
destination_blob_name = 'Gold/final_insurance_data.csv'
source_file_name = 'final_insurance_data.csv'

# Upload file
bucket = client.bucket(bucket_name)
blob = bucket.blob(destination_blob_name)
blob.upload_from_filename(source_file_name)

print(f"Uploaded {source_file_name} to gs://{bucket_name}/{destination_blob_name}")
