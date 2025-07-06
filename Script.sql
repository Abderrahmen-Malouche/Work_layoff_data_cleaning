-- Data Cleaning 

SELECT *
from layoffs;

-- 1- Remove Duplicates 
-- 2- Standardize the data 
-- 3- NULL values / blank values 
-- 4- Remove any columns that is irrelevant to our analysis

-- 1- Remove Duplicate 
CREATE TABLE layoff_staging
LIKE layoffs;

SELECT * FROM layoff_staging2;

INSERT INTO layoff_staging
SELECT *
FROM layoffs;

WITH duplicate_cte AS (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY  company ,location, industry , total_laid_off, percentage_laid_off, `date`,stage,country,funds_raised_millions) AS row_num
FROM layoff_staging
)
DELETE 
FROM duplicate_cte
where row_num > 1;

INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER (PARTITION BY  company ,location, industry , total_laid_off, percentage_laid_off, `date`,stage,country,funds_raised_millions) AS row_num
FROM layoff_staging;

DELETE 
FROM layoff_staging2
WHERE row_num > 1;

SELECT *
FROM layoff_staging2;


-- 2- Standardize data 

UPDATE layoff_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoff_staging2;

UPDATE layoff_staging2
SET industry = "Crypto"
WHERE industry LIKE "Crypto%";

UPDATE layoff_staging2
SET country= "United States"
WHERE country LIKE "United States%";

SELECT *
FROM layoff_staging2
WHERE country LIKE "United States%";

SELECT `date` , STR_TO_DATE(`date`,"%m/%d/%Y")
FROM layoff_staging2;

UPDATE layoff_staging2
SET `date`=STR_TO_DATE(`date`,"%m/%d/%Y");

SELECT `date`
FROM layoff_staging2;

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;

-- 3- Working with NULL and blank values 

SELECT distinct industry  
FROM layoff_staging2;

UPDATE layoff_staging2
SET industry=NULL 
WHERE industry = "";


UPDATE layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company= t2.company
Set t1.industry=t2.industry
WHERE t1.industry IS NULL and t2.industry IS NOT NULL;

SELECT *
FROM layoff_staging2;

DELETE
FROM layoff_staging2 
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

ALTER TABLE layoff_staging2
DROP COLUMN row_num;