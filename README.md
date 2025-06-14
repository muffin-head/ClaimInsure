

# 🛡️ Insurance Claim Prediction – Data Preparation & EDA

This repository is part of an end-to-end machine learning pipeline to predict insurance claim occurrence using customer and vehicle data. The project is currently focused on **data ingestion, validation, cleaning, and exploratory analysis**, laying the foundation for downstream modeling and deployment.

---

## ✅ Project Overview

**Business Objective:**
Predict whether a policyholder will file a claim in the next 12 months to enable:

* Risk-based pricing
* Loss minimization
* Fair and personalized underwriting

**Current Phase:**
We have completed data preprocessing, exploratory data analysis (EDA), and structured the dataset for model readiness.

---

## 📊 Current Status

| Module                 | Description                                        | Status             |
| ---------------------- | -------------------------------------------------- | ------------------ |
| Data Ingestion         | Raw data pulled from CSV / SQL export              | ✅ Done             |
| Data Cleaning          | Missing values, type conversions, parsing          | ✅ Done             |
| Sanity Checks          | SQL queries to validate distribution / patterns    | ✅ Done             |
| Feature Engineering    | Log transformation, binning, encoding              | ✅ Done             |
| EDA                    | Univariate, bivariate, multivariate visualizations | ✅ Done             |
| Feature Selection Prep | Dropped high-cardinality or redundant variables    | ✅ Done             |
| ML Modeling            | Model training and evaluation                      | 🚧 Not yet started |

---

## 📦 Data Sources

* Policy and vehicle records extracted from `behavior-based-claim.InsuranceClaimDataset.insurance_claims` (Google BigQuery)
* Columns include:

  * `customer_age`, `vehicle_age`, `model`, `fuel_type`, `region_code`, `region_density`, `segment`, `claim_status`, `max_torque`

---

## 🔍 SQL Sanity Checks

Before modeling, SQL queries were used to:

* Check class imbalance in `claim_status`
* Assess uniqueness of `policy_id`
* Validate cardinality and distribution of categorical columns (`model`, `region_code`)
* Confirm missing values and torque string format (`max_torque` ➝ parsed into `torque_Nm` and `torque_rpm`)


---

## 🧹 Feature Engineering Summary

| Feature                | Transformation                                 |
| ---------------------- | ---------------------------------------------- |
| `max_torque`           | Parsed into `torque_Nm` and `torque_rpm`       |
| `region_density`       | Applied log transformation to normalize        |
| `vehicle_age`          | Binned into categories (`<1yr`, `1-3yr`, etc.) |
| `model`, `region_code` | Dropped due to high cardinality                |
| `fuel_type`, `segment` | One-hot encoded                                |

---

## 📈 Exploratory Data Analysis (EDA)

### ✅ Univariate Analysis

* Histograms and KDE plots for continuous features
* CDF plots to visualize spread and skew
* Found skew in `region_density`, addressed with `log(region_density + 1)`

### ✅ Bivariate Analysis

* Bar plots of average claim rate by categorical features (`fuel_type`, `segment`)
* Box plots for numerical features by `claim_status`

### ✅ Multivariate Correlation

* Correlation heatmap for all continuous variables
* Confirmed minimal multicollinearity

### ✅ Outlier Detection

* Box plots used to identify IQR outliers in `vehicle_age`, `torque_Nm`, `region_density`
* Removed suspicious records like `torque_Nm = 1`

---

## 💾 Final Cleaned Dataset

Stored as: `EDA/final_insurance_data.csv`

* \~54,000 records post-cleaning
* No nulls in critical columns
* One-hot encoding applied
* Ready for scaling and modeling

---

## 🔗 Next Steps

* Apply feature scaling (StandardScaler)
* Train baseline models (Logistic Regression, Random Forest)
* Set up MLflow for experiment tracking
* Version dataset and model artifacts
* Push to GCP Bucket for BigQuery staging

---

## 📁 Repository Structure

```
claim-insurance/
│
├── EDA/
│   ├── EDA.ipynb                  # Data cleaning + visualization
│   └── final_insurance_data.csv   # Cleaned, encoded dataset
│
├── GCPdataLoading/
│   ├── DatafeatureLoadingGCP.py   # Upload CSV to GCS
│   └── loadbucketToBigQuery.py    # Load to BigQuery from GCS
│
├── README.md                      # Project overview and progress
```

---

Let me know if you'd like the README in `.md` or `.rst` format, or integrated with GitHub Wiki pages.
