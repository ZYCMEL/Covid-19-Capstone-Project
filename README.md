# Covid-19-Capstone-Project

Original Dataset Used From Kaggle: https://www.kaggle.com/datasets/meirnizri/covid19-dataset

## Overview

This project analyzes a COVID-19 patient dataset published by the Mexican Government containing approximately **1 million patient records** across **21 features**. The goal of this analysis is to identify the leading factors associated with COVID-19 mortality and provide insights that may contribute to improved prevention, protection, and treatment strategies.

The project combines **Python**, **Google BigQuery**, **statistical analysis**, *SQL*, **machine learning**, and **interactive dashboards** to uncover relationships between patient comorbidities and mortality outcomes.

---

## Dataset

- **Source:** Mexican Government COVID-19 Open Dataset
- **Records:** ~1,000,000 patients
- **Features:** 21 patient attributes
- **Tools Used:**
  - Python
  - Google BigQuery
  - Pandas
  - NumPy
  - Scikit-learn
  - SciPy
  - Power BI

---

## Data Preparation

Before analysis, the dataset required extensive cleaning and preprocessing.

### Data Cleaning Steps

- Imported data from **Google BigQuery**
- Standardized categorical values used by the Mexican Government
- Replaced placeholder values (`97`, `98`, and `99`) with `NULL`
- Organized and formatted variables for easier analysis
- Prepared the dataset for statistical modeling and visualization

*Figure 1 demonstrates the preprocessing workflow.*

---

## Exploratory Data Analysis (EDA)

### Patient Distribution

The first exploratory analysis examined the distribution of **male and female patients** across different medical care categories.

### Key Finding

- Hospitalized patients contained a noticeably higher proportion of males.
- This observation suggested a potential relationship between gender and disease severity.

*See Figure 2.*

---

### Comorbidity Correlation Analysis

A correlation analysis was performed between patient comorbidities and COVID-19 severity classifications.

### Key Findings

- **Pneumonia** showed the strongest relationship with severe patient classifications.
- Average correlation score:
  - **27.75**, significantly higher than other comorbidities.

This finding motivated additional statistical testing and machine learning analysis.

*See Figure 3.*

---

## Machine Learning

### Logistic Regression

A logistic regression model was built to estimate how individual comorbidities influence mortality risk.

### Results

Pneumonia emerged as the strongest predictor of death.

Patients diagnosed with pneumonia were:

- **13.46× more likely to die**
- Stronger predictor than any other measured comorbidity

Although other conditions contributed to mortality risk, none approached the impact of pneumonia.

*See Figure 4.*

---

### Statistical Hypothesis Testing

Because of the dataset's large sample size, a **Z-test** was performed to validate the relationship between pneumonia and mortality.

### Results

- **Z-statistic:** 479.18
- **P-value:** 0.0

The results strongly reject the null hypothesis and confirm a statistically significant association between pneumonia and death.

### Mortality Comparison

| Patient Group | Death Rate |
|---------------|-----------:|
| With Pneumonia | **38.51%** |
| Without Pneumonia | **2.50%** |

Patients with pneumonia were found to be:

> **15.42 times more likely to die** than patients without pneumonia.

This statistical result strengthened the findings produced by the logistic regression model.

*See Figure 5.*

---

## Data Visualization

### Dashboard 1 — COVID-19 Mortality Overview

An interactive dashboard was developed to visualize:

- COVID-19 deaths over time
- Distribution of comorbidities
- Hospitalization trends
- General mortality statistics

Major spikes in mortality occurred between:

- **April 2020**
- **August 2020**

*See Figure 6.*

---

### Dashboard 2 — Pneumonia Analysis

A second dashboard focused specifically on pneumonia.

Key insights include:

- Dramatically higher mortality among patients with pneumonia
- Male patients experienced substantially higher death rates
- Pneumonia consistently appeared as the strongest mortality indicator

*See Figure 7.*

---

## Key Findings

- Pneumonia is the strongest predictor of COVID-19 mortality.
- Patients with pneumonia are **15.42× more likely to die** than those without pneumonia.
- Logistic regression estimated a **13.46× increase** in mortality odds.
- Statistical testing confirmed an extremely significant relationship (p-value = 0.0).
- Male patients experienced disproportionately severe outcomes compared to females.
- Mortality peaked between **April and August 2020**.

---

## Project Structure

```
├── data/
├── notebooks/
├── dashboards/
├── figures/
├── models/
├── README.md
```

---

## Future Improvements

- Incorporate vaccination and treatment data
- Perform feature importance analysis using SHAP values
- Expand analysis to additional countries for comparison

---

## Conclusion

This analysis demonstrates that **pneumonia is the single most significant risk factor for COVID-19 mortality** within the Mexican Government dataset.

Combining exploratory data analysis, machine learning, statistical testing, and interactive dashboards consistently identified pneumonia as the strongest contributor to severe patient outcomes. These findings can help inform healthcare professionals and policymakers when prioritizing prevention, monitoring, and treatment strategies for high-risk COVID-19 patients.

---

## Author

**Ziyuan Cai**
