# adw-project


# Azure Data Pipeline Project – AdventureWorks Dataset

## 📘 Overview

This project demonstrates how to design and implement a **robust data pipeline** using **Azure Data Factory (ADF)**, **Azure Databricks**, and **Azure Synapse Analytics**, with data sourced from the **AdventureWorks datasets** on Kaggle. The goal is to build an end-to-end modern data platform following the **Bronze–Silver–Gold** architecture.

---

## 🏗️ Architecture

### Data Flow

1. **Source (HTTP):** AdventureWorks datasets are ingested from a public HTTP endpoint.
2. **Data Factory (ADF):** Performs data ingestion, orchestrating movement from source to Data Lake.
3. **Data Lake Gen2:** Stores data in three zones:

   * **Bronze:** Raw data as-is from the source.
   * **Silver:** Cleaned and transformed data using Databricks.
   * **Gold:** Aggregated and analytical-ready data in Synapse.
4. **Databricks:** Executes transformation and cleansing logic using PySpark.
5. **Synapse Analytics:** Serves curated datasets for analytical workloads.
6. **Power BI:** Provides visualization and reporting on top of Synapse.

### 🧩 Architecture Diagram

The pipeline follows the layered **medallion architecture**:

```
HTTP Source → ADF (Ingestion) → Data Lake (Bronze) → Databricks (Silver) → Synapse (Gold) → Power BI (Reports)
```

---

## ⚙️ Components Used

* **Azure Data Factory** – Ingestion and orchestration
* **Azure Databricks** – Data transformation (PySpark)
* **Azure Data Lake Gen2** – Data storage (Raw, Curated)
* **Azure Synapse Analytics** – Data warehouse and serving layer
* **Power BI** – Reporting and visualization
* **Azure Key Vault** – Secure credentials and secrets management

---

## 🧠 Implementation Steps

### 1. Data Ingestion (ADF)

* Configure **HTTP Linked Service** to connect to Kaggle dataset URLs.
* Use **Copy Activity** to move data to the Bronze layer in **Data Lake**.
* Schedule the pipeline with a **trigger** for automation.

### 2. Data Transformation (Databricks)

* Create a Databricks notebook connected via **Service Principal**.
* Transform and clean data using **PySpark**:
  * Null handling
  * Column standardization
* Write processed output to **Silver layer** in Data Lake.

### 3. Data Serving (Synapse)
* I have used serverless sql pool for serving layer.
* i have created firstly views for silver layer using openrowset.
* Created **external tables** on top of curated (silver) Parquet files upon that views using CETAS so this tables data stored in goldlayer in datalakegen2.
* Enable Power BI connectivity using **Serverless SQL Pool**.

### 4. Reporting (Power BI)

* Connect to Synapse SQL endpoint.
* To Build dashboards for downstreams.

---

## 🔒 Security Best Practices

* Used **Managed Identity** and **Service Principals** for secure connections.
* Implemented **RBAC** and **container-level access** in Data Lake.



## 🧾 Folder Structure

```
📂 azure-adventureworks-pipeline
│
├── data_source/              #  AdventureWorks CSVs
├── adf_pipelines/            # JSON definitions for ADF pipelines
├── databricks_notebooks/     # PySpark transformations
├── synapse_scripts/          # SQL scripts for external tables and views
└── README.md                 # Project documentation
```



This project demonstrates a complete, production-style Azure Data Engineering pipeline using **AdventureWorks datasets**, applying best practices in **data orchestration**, **transformation**, **security**, and **analytics**.
