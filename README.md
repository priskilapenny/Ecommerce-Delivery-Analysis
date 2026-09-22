# E-commerce Delivery Analysis
## Project Preview

An interactive Power BI dashboard analyzing order volume, shipping costs, delivery performance, warehouse operations, and customer experience using Power BI and SQL for data exploration.

This project analyzes supply chain and logistics data to identify:

- How order volume and order value change over time?
- How shipping costs vary across shipping methods and locations?
- Which carriers provide the best balance between cost and delivery performance?
- Does warehouse processing time contribute to late delivery?
- How does delivery performance relate to customer ratings and returns?

## Tech Stack

- Power BI: data cleaning, data modeling, DAX calculation, dashboard development
- Power Query: transformation, data type correction, dimension table creation
- DAX: KPI calculation, column calculation
- SQL: data exploration & validation

## Data Source

**Source:** Kaggle – E-Commerce Delivery and Shipping Data

**Records:** 50,000 orders

The dataset contains information:

| Category | Key Fields |
| --- | --- |
| Order | order_id, order_date, order_value_usd |
| Customer | customer_id, customer_segment, customer_city |
| Warehouse | warehouse_id, warehouse_city, warehouse_processing_hours |
| Shipping | shipping_method, carrier, shipping_cost_usd |
| Delivery | promised_delivery_days, actual_delivery_days, late_delivery, delivery_delay_days |
| Customer Experience | customer_rating, return_requested, return_reason |

## Data Preparation

- Missing value checks
- Duplicate value checks
- Validate and transform data types
- Create calculated categories such as delay day groups and order frequency groups

## Exploratory Data Analysis

- Number of unique customers, warehouses, and carriers
- Order Frequency by customers
- Total order value & average order value
- Customer distribution by city and country
- Top City by total order value
- Number of orders by warehouse and carrier
- Average warehouse processing hours
- Average warehouse processing hours and delays by warehouse
- Average warehouse processing hours and delays by package size
- Delivery delay days distribution
- Number of late deliveries by carrier

## Data Model

The Power BI data model was designed to support analysis across orders, customers, warehouses, shipping, delivery performance, and customer experience.
<img width="995" height="756" alt="Data_Model" src="https://github.com/user-attachments/assets/7c4a7c20-cf4d-4bea-8350-65df64cc52ff" />


## Dashboard Overview

1. Business Overview
    - Total Orders
    - Total Order values
    - Total Shipping Cost
    - Average Shipping Cost per Order
    - On Time rate
    - Total orders vs total order value by month
    - Total shipping cost vs on-time rate by month
    - Total late delivery vs on time delivery
    - Total order values vs total shipping cost by shipping method
    - Total shipping cost by customer city
2. Delivery Performance
    - Order per warehouse
    - Order per carrier
    - Average warehouse processing hours
    - On time rate
    - Average delay days
    - Average warehouse processing hours by warehouse and month
    - Average shipping cost per order vs average delay days by carrier
    - Late rate by month
    - Delay days distribution
3. Customer Experience
    - Average customer rating
    - Return rate
    - Total return
    - Average repeat order
    - Customer rating distribution
    - Customer rating by delivery delay days
    - Customer repeat order distribution
    - Return rate by delivery delay days
    - Return reason distribution

## Key Insight

## Recommendation
