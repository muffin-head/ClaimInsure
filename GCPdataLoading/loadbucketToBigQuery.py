from google.cloud import bigquery

client = bigquery.Client()

job_config = bigquery.LoadJobConfig(
    source_format=bigquery.SourceFormat.CSV,
    skip_leading_rows=1,
    autodetect=True,
)

uri = "gs://behavior-based-claim-severity-data/Insuranceclaimsdata.csv"

load_job = client.load_table_from_uri(
    uri,
    "behavior-based-claim.InsuranceClaimDataset.insurance_claims",
    job_config=job_config,
)

load_job.result()  # Wait for job to complete
