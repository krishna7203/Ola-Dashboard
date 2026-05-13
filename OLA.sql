CREATE DATABASE Ola;
USE Ola;

#1. Retrieve all successful bookings:
CREATE View Successful_Bookings As
SELECT * From bookings
WHERE Booking_Status ='Success';

SELECT * From Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
CREATE View ride_distance_for_each_vehicle As
Select Vehicle_Type,avg(Ride_Distance) 
As avg_distance From bookings
group by Vehicle_Type;

SELECT * From ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE View cancelled_rides_by_customers As
SELECT  count(*) From bookings
WHERE Booking_Status='Canceled by Customer';

SELECT * From cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
CREATE View Top_5_Customers As
SELECT Customer_ID,count(Booking_ID) As total_rides
FROM bookings
group by Customer_ID
order by total_rides DESC LIMIT 5;

SELECT * From Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver= 'Personal & Car related issue';

SELECT * From Rides_cancelled_by_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE View Max_Min_Driver_Rating As
SELECT max(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method='UPI';

SELECT * FROM UPI_Payment;

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type,avg(Customer_Rating) FROM bookings
group by Vehicle_Type;

SELECT * FROM AVG_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT sum(Booking_Value) FROM bookings
WHERE Booking_Status='Success';

SELECT * FROM total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM Incomplete_Rides_Reason;