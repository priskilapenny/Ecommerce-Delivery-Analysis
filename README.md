# E-commerce Delivery Analysis
## Project Preview

An interactive Power BI dashboard analyzing order volume, shipping costs, delivery performance, warehouse operations, and customer experience using Power BI and SQL for data exploration.

This project analyzes supply chain and logistics data to identify:

- How order volume and order value change over time?
- How shipping costs vary across shipping methods and locations?
- Which carriers provide the best balance between cost and delivery performance?
- Does warehouse processing time contribute to late delivery?
- How does delivery performance relate to customer ratings and returns?

### Dashboard Preview
<img width="1345" height="758" alt="Dashboard_Overview" src="https://github.com/user-attachments/assets/cdf8f5e6-2523-4c47-8b50-7f535461ab41" />
<img width="1346" height="758" alt="Dashboard_Delivery_Performance" src="https://github.com/user-attachments/assets/b5d4dfcd-c654-4b06-8ee9-d5bbb19a56f4" />
<img width="1347" height="757" alt="Dashboard_Customer_Experience" src="https://github.com/user-attachments/assets/c2f8badb-6127-4025-8df7-bfd1fb866f8e" />


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
- Order priority distribution
- Order Frequency by customers
- Total order value & average order value
- Customer distribution by city and country
- Top City by total order value
- Number of orders by warehouse and carrier
- Calculate average, minimum, and maximum values of warehouse processing hours
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
    
    ```visual-basic
    Total On-Time = CALCULATE(
        COUNT(FactOrders[order_id]),
        FactOrders[late_delivery]="No"
    )
    Total Orders = count(FactOrders[order_id])
    On-Time Rate = [Total On-Time]/[Total Orders]
    ```
    
    - Total orders vs total order value by month
    - Total shipping cost vs on-time rate by month
    - Total late delivery vs on time delivery
    - Total order values vs total shipping cost by shipping method
    - Total shipping cost by customer city
2. Delivery Performance
    - On-Time rate
    - Late rate
    - Mode of delay day
    
    ```visual-basic
    Mode of Delay Days = 
    VAR DelayValues = FILTER(
            VALUES('FactOrders'[delivery_delay_days]), 
            'FactOrders'[delivery_delay_days]<>0
    )
    VAR FrequencyTable = ADDCOLUMNS(
        DelayValues,
        "Frequency",
        CALCULATE(COUNTROWS('FactOrders'))
    )
    VAR MaxFrequency = MAXX(FrequencyTable, [Frequency])
    RETURN
    MAXX(
        FILTER(
            FrequencyTable,
            [Frequency] = MaxFrequency
        ),
        'FactOrders'[delivery_delay_days]
    )
    ```
    
    - Average warehouse processing hours
    - Average shipping costs per order
    - Late rate by month
    - Average warehouse processing hours by warehouse and month
    - Delay days distribution
    
    ```visual-basic
    Delay Days Group = 
    SWITCH(
        TRUE(),
        AND('FactOrders'[delivery_delay_days] > 0, FactOrders[delivery_delay_days] <= 2), "1-2 Days",
        AND('FactOrders'[delivery_delay_days] > 2, FactOrders[delivery_delay_days] <= 4), "3-4 Days",
        AND('FactOrders'[delivery_delay_days] > 4, FactOrders[delivery_delay_days] <= 6), "5-6 Days",
        AND('FactOrders'[delivery_delay_days] > 6, FactOrders[delivery_delay_days] <= 8), "7-8 Days",
        AND('FactOrders'[delivery_delay_days] > 8, FactOrders[delivery_delay_days] <= 10), "9-10 Days",
        FactOrders[delivery_delay_days] > 10, "> 10 Days",
        "0 Days"
    )
    ```
    
    - Average shipping cost per order vs average delay days by carrier
    - Late rate vs. On-Time rate by warehouse processing time
3. Customer Experience
    - Median of customer rating
    - Median of repeat orders per customer
    - Return rate
    - Total return
    - Customer rating distribution
    - Customer rating by delivery delay days
    - Customer repeat order frequency
    - Return rate by delivery delay days
    - Return reason distribution

### Key Findings

- Order volume and order value show a similar monthly pattern.
- International delivery has the highest shipping cost, while its order value does not increase proportionally.
- The late delivery rate stands at 56.32%, with one-day delays for the largest share of late deliveries.
- Carrier ParcelPro combines relatively low shipping cost with a high on-time rate, while carrier SpeedyCargo achieves similar performance at a higher cost.
- The late delivery rate tends to increase as warehouse processing time increases.
- Customer ratings were lower among orders with longer delivery delays.
- Late delivery is not the main reason for product returns; however, orders with delays of up to 9 days show a relatively high return rate.

### Recommendation

- Review the international shipping strategy to identify opportunities to improve cost efficiency without compromising delivery performance.
- Optimize carrier allocation by considering shipping costs, on-time delivery performance, and shipment volume.
- Investigate operational bottlenecks in warehouses with higher processing times.
- Prioritize short-delay reduction through improved dispatch scheduling and early delivery monitoring, as one-day delays represent the largest share of late deliveries.
