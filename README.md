# 🧹 SQL Data Cleaning Project – Tech Layoffs Dataset

This project demonstrates a complete **SQL-based data cleaning process** using a dataset of tech company layoffs. The raw data is loaded into a staging table, cleaned through several structured steps, and made ready for further analysis or visualization.

---

## 🗃️ Dataset Overview

The dataset, named `layoffs`, contains information about layoffs in the tech industry, including:
- Company name
- Location
- Industry
- Number and percentage of employees laid off
- Date of the layoff
- Company stage
- Country
- Funds raised

---

## 🧼 Cleaning Steps

The cleaning process was completed in **MySQL** and follows best practices for staging, preserving raw data, and transforming data in logical steps.

### 1️⃣ Remove Duplicates
- Created a staging table: `layoff_staging`
- Used `ROW_NUMBER()` over all relevant columns to identify exact duplicates
- Kept only the first occurrence of each duplicate entry

### 2️⃣ Standardize the Data
- Trimmed whitespace from company names
- Corrected inconsistencies in `industry` and `country` fields (e.g., "Crypto Web3" → "Crypto", "United States." → "United States")
- Converted date column from string to `DATE` format using `STR_TO_DATE`
- Cleaned up capitalization or typos where needed

### 3️⃣ Handle Nulls and Blank Values
- Converted blank strings in `industry` to `NULL`
- Used `JOIN` logic to **fill missing industry values** based on company name matches
- Removed rows where both `total_laid_off` and `percentage_laid_off` were `NULL`

### 4️⃣ Drop Irrelevant Columns
- Dropped the temporary `row_num` column used during the duplicate removal process

---

## 🧑‍💻 Tools Used

- SQL (MySQL dialect)
- Git / GitHub for version control
- MySQL Workbench 

---

## 📂 Files

- `script.sql` – The full SQL script used to clean the dataset step-by-step
- `README.md` – This file

---

## 📌 Project Motivation

In real-world data projects, raw data is rarely clean or analysis-ready. This project shows how a data analyst can:
- Preserve raw data integrity
- Use staging tables to iteratively clean data
- Identify and correct data quality issues
- Leverage SQL functions like `ROW_NUMBER()`, `JOIN`, and `STR_TO_DATE()` for transformation

---
