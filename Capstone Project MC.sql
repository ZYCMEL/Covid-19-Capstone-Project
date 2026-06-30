#How many people died in each month of across the years?

SELECT
    YEAR,
    MONTH,
    SEX,
    SUM(DIED) AS Deaths
FROM my_data.covid_data_cleaned
WHERE YEAR IS NOT NULL
  AND MONTH IS NOT NULL
GROUP BY YEAR, MONTH, SEX
ORDER BY YEAR, MONTH, SEX;

#How many people had pneumonia in each month of across the years?

SELECT
    YEAR,
    MONTH,
    SEX,
    SUM(PNEUMONIA) AS pneumonia
FROM my_data.covid_data_cleaned
WHERE YEAR IS NOT NULL
  AND MONTH IS NOT NULL
GROUP BY YEAR, MONTH, SEX
ORDER BY YEAR, MONTH, SEX;

#Distribution of symptoms between male and female

SELECT
    SEX,
    COUNT(*) AS total_patients,

    SUM(CASE WHEN INTUBED	= 1 THEN 1 ELSE 0 END) AS intubed_cases,
    SUM(CASE WHEN PNEUMONIA = 1 THEN 1 ELSE 0 END) AS pneumonia_cases,
    SUM(CASE WHEN PREGNANT = 1 THEN 1 ELSE 0 END) AS pregnant_cases,
    SUM(CASE WHEN DIABETES = 1 THEN 1 ELSE 0 END) AS diabetes_cases,
    SUM(CASE WHEN COPD = 1 THEN 1 ELSE 0 END) AS copd_cases,
    SUM(CASE WHEN ASTHMA = 1 THEN 1 ELSE 0 END) AS asthma_cases,
    SUM(CASE WHEN INMSUPR = 1 THEN 1 ELSE 0 END) AS immunosuppressed_cases,
    SUM(CASE WHEN HYPERTENSION = 1 THEN 1 ELSE 0 END) AS hypertension_cases,
    SUM(CASE WHEN OTHER_DISEASE = 1 THEN 1 ELSE 0 END) AS other_disease_cases,
    SUM(CASE WHEN CARDIOVASCULAR = 1 THEN 1 ELSE 0 END) AS cardiovascular_cases,
    SUM(CASE WHEN OBESITY = 1 THEN 1 ELSE 0 END) AS obesity_cases,
    SUM(CASE WHEN RENAL_CHRONIC = 1 THEN 1 ELSE 0 END) AS renal_chronic_cases,
    SUM(CASE WHEN TOBACCO = 1 THEN 1 ELSE 0 END) AS tobacco_cases,
    SUM(CASE WHEN ICU = 1 THEN 1 ELSE 0 END) AS icu_cases

FROM my_data.covid_data_cleaned
GROUP BY SEX
ORDER BY SEX;

#Percent of patients who had or didn't have a certain symptoms grouped by their type.

SELECT
    PATIENT_TYPE,
    COUNT(*) AS total_patients,

    ROUND(100.0 * AVG(INTUBED), 2) AS intubed_yes_pct,
    ROUND(100.0 * (1 - AVG(INTUBED)), 2) AS intubed_no_pct,

    ROUND(100.0 * AVG(PNEUMONIA), 2) AS pneumonia_yes_pct,
    ROUND(100.0 * (1 - AVG(PNEUMONIA)), 2) AS pneumonia_no_pct,

    ROUND(100.0 * AVG(PREGNANT), 2) AS pregnant_yes_pct,
    ROUND(100.0 * (1 - AVG(PREGNANT)), 2) AS pregnant_no_pct,

    ROUND(100.0 * AVG(DIABETES), 2) AS diabetes_yes_pct,
    ROUND(100.0 * (1 - AVG(DIABETES)), 2) AS diabetes_no_pct,

    ROUND(100.0 * AVG(COPD), 2) AS copd_yes_pct,
    ROUND(100.0 * (1 - AVG(COPD)), 2) AS copd_no_pct,

    ROUND(100.0 * AVG(ASTHMA), 2) AS asthma_yes_pct,
    ROUND(100.0 * (1 - AVG(ASTHMA)), 2) AS asthma_no_pct,

    ROUND(100.0 * AVG(INMSUPR), 2) AS inmsupr_yes_pct,
    ROUND(100.0 * (1 - AVG(INMSUPR)), 2) AS inmsupr_no_pct,

    ROUND(100.0 * AVG(HYPERTENSION), 2) AS hypertension_yes_pct,
    ROUND(100.0 * (1 - AVG(HYPERTENSION)), 2) AS hypertension_no_pct,

    ROUND(100.0 * AVG(OTHER_DISEASE), 2) AS other_disease_yes_pct,
    ROUND(100.0 * (1 - AVG(OTHER_DISEASE)), 2) AS other_disease_no_pct,

    ROUND(100.0 * AVG(CARDIOVASCULAR), 2) AS cardiovascular_yes_pct,
    ROUND(100.0 * (1 - AVG(CARDIOVASCULAR)), 2) AS cardiovascular_no_pct,

    ROUND(100.0 * AVG(OBESITY), 2) AS obesity_yes_pct,
    ROUND(100.0 * (1 - AVG(OBESITY)), 2) AS obesity_no_pct,

    ROUND(100.0 * AVG(RENAL_CHRONIC), 2) AS renal_chronic_yes_pct,
    ROUND(100.0 * (1 - AVG(RENAL_CHRONIC)), 2) AS renal_chronic_no_pct,

    ROUND(100.0 * AVG(TOBACCO), 2) AS tobacco_yes_pct,
    ROUND(100.0 * (1 - AVG(TOBACCO)), 2) AS tobacco_no_pct,

    ROUND(100.0 * AVG(ICU), 2) AS icu_yes_pct,
    ROUND(100.0 * (1 - AVG(ICU)), 2) AS icu_no_pct

FROM my_data.covid_data_cleaned
GROUP BY PATIENT_TYPE
ORDER BY PATIENT_TYPE;

#By the end of treatment, what is their diagnosis state.

SELECT
    CLASSIFICATION_FINAL_NEW,
    SEX,
    COUNT(*) AS total_patients,

    SUM(CASE WHEN INTUBED	= 1 THEN 1 ELSE 0 END) AS intubed_cases,
    SUM(CASE WHEN PNEUMONIA = 1 THEN 1 ELSE 0 END) AS pneumonia_cases,
    SUM(CASE WHEN PREGNANT = 1 THEN 1 ELSE 0 END) AS pregnant_cases,
    SUM(CASE WHEN DIABETES = 1 THEN 1 ELSE 0 END) AS diabetes_cases,
    SUM(CASE WHEN COPD = 1 THEN 1 ELSE 0 END) AS copd_cases,
    SUM(CASE WHEN ASTHMA = 1 THEN 1 ELSE 0 END) AS asthma_cases,
    SUM(CASE WHEN INMSUPR = 1 THEN 1 ELSE 0 END) AS immunosuppressed_cases,
    SUM(CASE WHEN HYPERTENSION = 1 THEN 1 ELSE 0 END) AS hypertension_cases,
    SUM(CASE WHEN OTHER_DISEASE = 1 THEN 1 ELSE 0 END) AS other_disease_cases,
    SUM(CASE WHEN CARDIOVASCULAR = 1 THEN 1 ELSE 0 END) AS cardiovascular_cases,
    SUM(CASE WHEN OBESITY = 1 THEN 1 ELSE 0 END) AS obesity_cases,
    SUM(CASE WHEN RENAL_CHRONIC = 1 THEN 1 ELSE 0 END) AS renal_chronic_cases,
    SUM(CASE WHEN TOBACCO = 1 THEN 1 ELSE 0 END) AS tobacco_cases,
    SUM(CASE WHEN ICU = 1 THEN 1 ELSE 0 END) AS icu_cases

FROM my_data.covid_data_cleaned
GROUP BY CLASSIFICATION_FINAL_NEW, SEX
ORDER BY CLASSIFICATION_FINAL_NEW;

#Statistic of patients across year and month.

SELECT
    YEAR,
    MONTH,
    COUNT(*) AS total_patients,

    SUM(INTUBED) AS intubed_count,
    SUM(PNEUMONIA) AS pneumonia_count,
    SUM(PREGNANT) AS pregnant_count,
    SUM(DIABETES) AS diabetes_count,
    SUM(COPD) AS copd_count,
    SUM(ASTHMA) AS asthma_count,
    SUM(INMSUPR) AS immunosuppressed_count,
    SUM(HYPERTENSION) AS hypertension_count,
    SUM(OTHER_DISEASE) AS other_disease_count,
    SUM(CARDIOVASCULAR) AS cardiovascular_count,
    SUM(OBESITY) AS obesity_count,
    SUM(RENAL_CHRONIC) AS renal_chronic_count,
    SUM(TOBACCO) AS tobacco_count,
    SUM(ICU) AS icu_count

FROM my_data.covid_data_cleaned
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;

#Top 5 most leathal symptoms

WITH symptom_death_rates AS (

    SELECT 'PNEUMONIA' AS condition,
           COUNT(*) AS total_cases,
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END) AS deaths,
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0.0 END) AS death_rate
    FROM my_data.covid_data_cleaned
    WHERE PNEUMONIA = 1

    UNION ALL

    SELECT 'DIABETES',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE DIABETES = 1

    UNION ALL

    SELECT 'COPD',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE COPD = 1

    UNION ALL

    SELECT 'ASTHMA',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE ASTHMA = 1

    UNION ALL

    SELECT 'INMSUPR',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE INMSUPR = 1

    UNION ALL

    SELECT 'HYPERTENSION',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE HYPERTENSION = 1

    UNION ALL

    SELECT 'OTHER_DISEASE',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE OTHER_DISEASE = 1

    UNION ALL

    SELECT 'CARDIOVASCULAR',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE CARDIOVASCULAR = 1

    UNION ALL

    SELECT 'OBESITY',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE OBESITY = 1

    UNION ALL

    SELECT 'RENAL_CHRONIC',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE RENAL_CHRONIC = 1

    UNION ALL

    SELECT 'TOBACCO',
           COUNT(*),
           SUM(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1 ELSE 0 END),
           AVG(CASE WHEN DATE_DIED_NEW IS NOT NULL THEN 1.0 ELSE 0 END)
    FROM my_data.covid_data_cleaned
    WHERE TOBACCO = 1
)

SELECT
    condition,
    total_cases,
    deaths,
    ROUND(100 * death_rate, 2) AS death_rate_pct
FROM symptom_death_rates
ORDER BY death_rate DESC
LIMIT 5;

#Death rate of the different USMER with whether or not they had pneumonia

SELECT
    USMER,
    PATIENT_TYPE,
    PNEUMONIA,
    COUNT(*) AS total_cases,
    SUM(DIED) AS deaths,
    ROUND(100.0 * SUM(DIED) / COUNT(*), 2) AS death_rate_pct
FROM my_data.covid_data_cleaned
WHERE USMER IS NOT NULL
  AND PNEUMONIA IS NOT NULL
GROUP BY USMER, PATIENT_TYPE, PNEUMONIA
ORDER BY USMER, PATIENT_TYPE, PNEUMONIA;


