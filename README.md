# ola_rides_data_analysis_project
# OLA Ride Booking Analysis Dashboard | Power BI

## Project Overview
An interactive Power BI dashboard built to analyze OLA ride-booking data for July 2024. The project explores booking trends, revenue, cancellations, vehicle performance, and customer and driver ratings to derive meaningful business insights.

## Dashboard Preview

### 1. Overall Dashboard
<img width="1083" height="613" alt="image" src="https://github.com/user-attachments/assets/95be3032-58b0-4b5e-b43d-c3ecf740e97f" />


### 2. Vehicle Type Analysis
<img width="1087" height="618" alt="image" src="https://github.com/user-attachments/assets/721a86fa-bf17-4614-b253-150e96b96819" />


### 3. Revenue Analysis
<img width="1082" height="622" alt="image" src="https://github.com/user-attachments/assets/9bb0f698-c382-4c42-a587-cdb38b97b832" />


### 4. Cancellation Analysis
<img width="1087" height="620" alt="image" src="https://github.com/user-attachments/assets/2609d403-5352-4244-b93c-144b706ccf89" />


### 5. Ratings Analysis
<img width="1083" height="626" alt="image" src="https://github.com/user-attachments/assets/e05034c9-2f07-4725-bebb-209529aee7f1" />


## Objectives
- Analyze overall ride-booking performance.
- Compare bookings across vehicle types.
- Evaluate booking value and revenue trends.
- Identify booking cancellation patterns.
- Analyze customer and driver ratings.
- Present key performance indicators through interactive visualizations.

## Tools & Technologies
- **Power BI** — Dashboard development and visualization
- **Power Query** — Data preparation and transformation
- **DAX** — Measures and KPI calculations
- **Data Analysis** — Booking, revenue, cancellation, and rating analysis

## Key Metrics

| Metric | Value |
|---|---:|
| Total Bookings | 103,024 |
| Successful Bookings | 63,967 |
| Cancelled Bookings | 28,933 |
| Total Booking Value | 35,080,467 |
| Analysis Period | July 1–31, 2024 |

*Note: Metrics are reported by the dashboard and should be validated against the underlying dataset.*

## Analysis Areas

### Booking Performance
- Total and successful bookings
- Booking status distribution
- Ride-booking trends

### Vehicle Type Analysis
- Booking distribution by vehicle category
- Comparison of vehicle performance

### Revenue Analysis
- Total booking value
- Revenue trends and comparisons

### Cancellation Analysis
- Booking cancellations
- Customer and driver cancellation patterns

### Ratings Analysis
- Customer ratings
- Driver ratings
- Rating comparisons across categories

- ## 📈 SQL-Based Business Insights Report

This report translates the OLA ride-booking analysis into business observations using SQL and Power BI. The analysis covers booking performance, vehicle types, customer behavior, revenue, cancellations, and ride ratings for July 2024.

### 1. Overall Booking Performance
- The dashboard reports **103,024 total bookings** during the analysis period.
- **63,967 successful bookings** were recorded, indicating substantial completed-ride activity.
- **28,933 bookings were cancelled**, making cancellations an important area for operational improvement.
- The dashboard figures suggest an opportunity to investigate the reasons behind unsuccessful bookings and improve the overall booking experience.
- SQL can be used to retrieve successful bookings and group booking records by status to understand the distribution of ride outcomes.

**SQL query:**
```sql
SELECT Booking_Status, COUNT(*) AS total_bookings
FROM bookings
GROUP BY Booking_Status
ORDER BY total_bookings DESC;
```

### 2. Vehicle Type and Ride Distance Analysis
- Comparing average ride distance across vehicle types helps identify differences in usage patterns.
- Ranking vehicle types by ride distance helps highlight categories that contribute significantly to total travel distance.
- These results can support decisions about vehicle availability, demand planning, and service-category performance.
- The SQL results should be reviewed alongside booking counts and booking value before deciding which vehicle category performs best.

**SQL query:**
```sql
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type
ORDER BY avg_distance DESC;
```

### 3. Customer Booking Behavior
- Identifying the five customers with the highest number of bookings helps highlight frequent users.
- Frequent customers may represent an opportunity for retention campaigns, loyalty benefits, and targeted offers.
- Booking frequency should be evaluated separately from spending: a customer with many rides may not necessarily generate the highest booking value.
- Combining ride frequency with booking value can provide a more complete view of customer contribution.

**SQL query:**
```sql
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
```

### 4. Revenue and Payment Method Analysis
- The dashboard reports a total booking value of **35,080,467**. The currency unit should be confirmed from the source dataset before interpreting this amount financially.
- Comparing booking value by payment method helps identify how customers pay for rides.
- Calculating booking value from successful rides provides a more relevant measure of completed-service value than summing every booking, including cancelled rides.
- Identifying the highest-value customers can help prioritize customer retention and personalized offers.

**SQL query — successful booking value:**
```sql
SELECT
    SUM(Booking_Value) AS total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';
```

**SQL query — booking value by payment method:**
```sql
SELECT
    Payment_Method,
    SUM(Booking_Value) AS total_booking_value
FROM bookings
WHERE Booking_Status = 'Success'
GROUP BY Payment_Method
ORDER BY total_booking_value DESC;
```

### 5. Customer and Driver Cancellation Analysis
- The SQL analysis identifies bookings cancelled by customers and driver cancellations attributed to personal or car-related issues.
- Separating customer-side and driver-side cancellations helps distinguish demand-related issues from potential driver or vehicle availability problems.
- Investigating the most frequent cancellation reasons can guide improvements in service reliability and customer communication.
- The dashboard's cancellation counts should be interpreted alongside the total number of bookings and the exact cancellation categories.

**SQL query — customer cancellations:**
```sql
SELECT COUNT(*) AS customer_cancelled_rides
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';
```

**SQL query — driver cancellations due to personal or car-related issues:**
```sql
SELECT COUNT(*) AS driver_cancelled_rides
FROM bookings
WHERE cancelled_Rides_by_Driver =
      'Personal & Car related issue';
```

### 6. Incomplete Ride Analysis
- Incomplete rides represent bookings that did not reach the expected completion stage.
- Grouping incomplete rides by reason can reveal recurring operational issues.
- Understanding these reasons may help prioritize vehicle maintenance, improve ride fulfilment, and reduce avoidable service failures.

**SQL query:**
```sql
SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
```

### 7. Customer and Driver Ratings
- Average customer ratings by vehicle type help compare customer-reported service experiences.
- Maximum and minimum driver ratings for Prime Sedan bookings show the range of recorded driver ratings.
- Comparing customer and driver ratings can help identify vehicle categories or rides that may require further investigation.
- Ratings should be evaluated alongside ride volume and successful bookings to avoid drawing conclusions from small samples.

**SQL query — average customer rating by vehicle type:**
```sql
SELECT
    Vehicle_Type,
    AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type
ORDER BY avg_customer_rating DESC;
```

**SQL query — Prime Sedan driver ratings:**
```sql
SELECT
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
```

### 8. Key Business Recommendations
- **Reduce cancellations:** Examine the leading customer and driver cancellation reasons and prioritize corrective actions.
- **Improve ride completion:** Track incomplete rides and address the most frequent failure categories.
- **Strengthen customer retention:** Use the top-customer analysis to identify frequent users and explore appropriate loyalty initiatives.
- **Optimize vehicle availability:** Compare booking volume, average ride distance, and booking value across vehicle types.
- **Monitor payment behavior:** Use payment-method revenue analysis to understand completed-ride payment patterns.
- **Improve service quality:** Compare customer and driver ratings across vehicle types and investigate persistent rating differences.
- **Support data-driven decisions:** Monitor booking status, booking value, cancellations, ride distance, and ratings together rather than relying on a single KPI.

### 9. Conclusion
This project demonstrates how SQL and Power BI can be combined to analyze ride-booking operations and present business-relevant metrics. SQL supports filtering, aggregation, ranking, and investigation of booking records, while Power BI communicates trends and comparisons through dashboard visualizations.

The dashboard provides a starting point for identifying potential operational improvements. Further conclusions about the causes of cancellations, top-performing vehicle categories, and revenue drivers should be confirmed by examining the underlying SQL query results.

**Tools used:** SQL, Power BI, data aggregation, business analysis, and data visualization.

## Repository Structure

```text
ola-ride-booking-analysis/
├── README.md
├── OLA_Ride_Booking_Dashboard.pdf
└── images/
    ├── dashboard-1.png
    ├── dashboard-2.png
    ├── dashboard-3.png
    ├── dashboard-4.png
    └── dashboard-5.png
