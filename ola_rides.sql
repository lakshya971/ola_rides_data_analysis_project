-- create database ola;
USE ola;

-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT * FROM ola_rides
WHERE Booking_Status = "Success";

-- 1. Retrieve all successful bookings using views:
SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance)
AS avg_distance FROM ola_rides
GROUP BY Vehicle_Type;

-- average ride distance for each vehicle type USING view
SELECT * FROM ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW count_of_rides_canceled_by_customers AS
SELECT COUNT(*) FROM ola_rides
WHERE Booking_Status = 'Canceled by Customer';

-- total number of cancelled rides by customers
SELECT * FROM count_of_rides_canceled_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides FROM ola_rides
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

-- top 5 customers who booked the highest number of rides:
SELECT * FROM top_5_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW rides_canceled_by_driver_due_to_personal_car_related_issues AS
SELECT COUNT(*) FROM ola_rides
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- number of rides cancelled by drivers due to personal and car-related issues:
SELECT * FROM rides_canceled_by_driver_due_to_personal_car_related_issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW max_min_ratings_for_primne_sedan AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating
FROM ola_rides WHERE Vehicle_Type = 'Prime Sedan';

-- maximum and minimum driver ratings for Prime Sedan
SELECT * FROM max_min_ratings_for_primne_sedan;

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW rides_using_UPI AS
SELECT Booking_ID, Payment_Method FROM ola_rides
WHERE Payment_Method = 'UPI';

-- Retrieve all rides where payment was made using UPI
SELECT * FROM rides_using_UPI;

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW average_customer_rating_per_vehicle_type AS
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_ratings
FROM ola_rides
GROUP BY Vehicle_Type;

-- average customer rating per vehicle type
SELECT * FROM average_customer_rating_per_vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW booking_value_of_rides_completed_successfully AS
SELECT SUM(Booking_Value) AS total_booking_value
FROM ola_rides
WHERE Booking_Status = 'Success';

-- total booking value of rides completed successfully
SELECT * FROM booking_value_of_rides_completed_successfully;

-- 10. List all incomplete rides along with the reason
SELECT Booking_ID, Incomplete_Rides_Reason
FROM ola_rides
WHERE Incomplete_Rides = 'Yes';






