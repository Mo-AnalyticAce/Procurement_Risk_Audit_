--WHAT IS THE MONEY LEAK(Are we actually paying the price we agreed upon?)

--METRIC 1:price difference per unit
SELECT Supplier,
		Item_Category, 
		AVG(Unit_Price-Negotiated_Price) AS price_difference_per_unit,

--METRIC 2:what is the total money lost?
 SUM(("unit_price"-"negotiated_price")*quantity) AS total_money_leak,

--METRIC 3:is it a one_time something? 
COUNT(po_id) AS total_orders
FROM Procurement_KPIs
GROUP BY supplier,item_category
ORDER BY total_money_leak;

--How many days does it take for items to arrive?
SELECT supplier,item_category, AVG(Datediff(day, order_date, delivery_date)* 1) AS esitimated_delivery_days
FROM Procurement_KPIs
WHERE order_date IS NOT NULL
AND delivery_date IS NOT NULL
GROUP BY supplier, item_category;

--Who are our high_risk suppliers based on the volume of defective goods they send?
SELECT supplier,SUM(defective_units) AS total_defective_good
FROM Procurement_KPIs
GROUP BY supplier 
ORDER BY total_defective_good;

--Which suppliers are failing to meet out compliance standard
SELECT supplier,
CASE WHEN Compliance=1 THEN 'YES' ELSE 'No'
END AS Compliance_status,
COUNT(*) AS uncompliant
FROM Procurement_KPIs
GROUP BY Supplier, Compliance
ORDER BY compliance;

--unit price trends
SELECT DATENAME(Month,Order_date) AS Order_month, item_category, Supplier, AVG(Unit_price) AS Avg_price
FROM Procurement_KPIs
GROUP BY DATENAME(Month,Order_date),item_category,Supplier
ORDER BY Order_month;

--  Value at Risk due to missing documentation
SELECT 
    Supplier,
    COUNT(PO_ID) AS Count_Missing_Dates,

    -- Total value of goods we claim to have but cannot prove when they arrived
    SUM(Quantity * Unit_Price) AS Total_Value_At_Risk,

    -- how much has a money leak?
    SUM(Quantity * (Unit_Price - Negotiated_Price)) AS Associated_Money_Leak
FROM Procurement_KPIs
WHERE Delivery_Date IS NULL
GROUP BY Supplier
ORDER BY Total_Value_At_Risk DESC;
