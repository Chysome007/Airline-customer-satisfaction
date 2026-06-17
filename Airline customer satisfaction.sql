-- Population of customers who are either satisfied or dissatisfied by our service
SELECT 
    satisfaction, COUNT(satisfaction) AS Total
FROM
    airline_customer_satisfaction
GROUP BY satisfaction;

-- Because of our goal to improve our service our goal is winning back
-- our dissatisfied customers
SELECT count(satisfaction) AS Total_dissatisfied
from airline_customer_satisfaction
where satisfaction = 'dissatisfied';

-- We need to send an apology mail to our customers of a certain age group
SELECT count(satisfaction) as Dissatisfied_adults
from airline_customer_satisfaction
where satisfaction = 'dissatisfied' and Age >= 18;

-- Identify passengers who flew Business class that experienced
-- service dissatisfaction
SELECT count(satisfaction) as Dissatisfied_Business_class
FROM airline_customer_satisfaction
WHERE satisfaction = 'dissatisfied' and Class = 'Business';

-- Identify only loyal customers who experienced service dissatisfaction
SELECT count(satisfaction) AS Dissatisfied_Loyal_customer
FROM airline_customer_satisfaction
WHERE satisfaction = 'dissatisfied' and Customer_Type = 'Loyal customer';

-- Identify our loyal customers in Business class who experienced dissatisfaction
SELECT count(satisfaction) AS Dissatisfied_Business_Loyal_customer
FROM airline_customer_satisfaction
WHERE satisfaction = 'dissatisfied' and Customer_Type = 'Loyal customer' and class = 'Business';

-- Identify the maximum and the minimum age of customers that flew with us 
SELECT max(Age) - min(Age) As Age_range, max(Age), min(Age)
FROM airline_customer_satisfaction;

-- Category of passengers who we prioritize for incentives
SELECT*FROM airline_customer_satisfaction
WHERE Customer_Type = 'Loyal customer' and Class = 'Business' and satisfaction = 'dissatisfied'
ORDER BY Customer_Type;

-- Since we are concerned by services under our control, we churn the data
-- according to our job processes highlighting the loyal customers who are in Business class
SELECT satisfaction, Age, Customer_Type, Class, Baggage_handling, Checkin_service, Cleanliness,
Departure_Delay_in_Minutes
FROM airline_customer_satisfaction 
WHERE satisfaction = 'dissatisfied' AND Customer_Type = 'Loyal customer'
AND Class = 'Business'
ORDER BY Customer_Type;

-- We created a new table for our loyal customers in business class
-- so we can identify the different age segments
-- which qualify for the incentives 
SELECT
Case
WHEN Age < 10 THEN 'Under_10'
WHEN Age BETWEEN 11 AND 20 THEN '11-20'
WHEN Age BETWEEN 40 AND 100 THEN'Adults'
ELSE 'Uknown'
END AS Age_group,
count(Age) as count
FROM dissatisfied_hybrid_passengers
GROUP BY age_group
ORDER BY MIN(Age);

-- Areas of concern
SELECT satisfaction, Age, Customer_Type, Class, Baggage_handling, Checkin_service, Cleanliness,
Departure_Delay_in_Minutes
FROM airline_customer_satisfaction 
WHERE satisfaction = 'dissatisfied'
ORDER BY Customer_Type;

-- Baggage Handling service
SELECT count(Baggage_handling) As Baggage_Excellent_service
FROM airline_customer_satisfaction
WHERE Baggage_handling = 4 and 5;

SELECT count(Baggage_handling) As Baggage_fair_service
FROM airline_customer_satisfaction
WHERE Baggage_handling = 2 and 3;

SELECT count(Baggage_handling) AS Baggage_poor_service
FROM airline_customer_satisfaction
WHERE Baggage_handling = 0 and 1;

-- Checkin service
SELECT count(checkin_service) As Checkin_Exellence_service
FROM airline_customer_satisfaction
WHERE Checkin_service =4 and 5;

SELECT count(Checkin_service) AS Checkin_fair_service
FROM airline_customer_satisfaction
WHERE Checkin_service = 2 and 3;

SELECT count(Checkin_service) As Checkin_poor_service
FROM airline_customer_satisfaction
WHERE Checkin_service = 0 and 1;

-- Cleanliness
SELECT count(cleanliness) AS Clean_Exellence_service
FROM airline_customer_satisfaction
WHERE Cleanliness = 4 and 5;

SELECT count(Cleanliness) AS Clean_fair_service
FROM airline_customer_satisfaction
WHERE Cleanliness = 2 and 3;

SELECT count(Cleanliness) AS Clean_poor_service
FROM airline_customer_satisfaction
WHERE Cleanliness = 0 and 1;

-- Departure 
SELECT count(Departure_Delay_in_minutes) As On_time_departure
FROM airline_customer_satisfaction
WHERE Departure_Delay_in_Minutes = 0;

SELECT count(Departure_Delay_in_minutes) AS Insignificant_delay
FROM airline_customer_satisfaction
WHERE Departure_Delay_in_Minutes BETWEEN 1 and 9;

SELECT count(Departure_Delay_in_minutes) As Significant_delay
FROM airline_customer_satisfaction
WHERE Departure_Delay_in_Minutes BETWEEN 10 and 500


