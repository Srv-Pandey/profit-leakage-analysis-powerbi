-- Created new Database
Create Database SuperStore_Sales;

--For Retrieving all the data in table
SELECT * from Sales;

-- Modify the data type of Profit/Sales Column
Alter table Sales
Alter Column Profit Numeric;

-- Retrieve total sales & total profit
SELECT
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Sales;

-- Retrieve all category total sales, total profit, Profit on sales (Lowest to highest)
SELECT Category,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Sales
Group By Category
Order BY Total_Profit DESC;

-- Which Sub Category generating overall loss
   Select [Sub-Category],
   Sum(Profit) As Profit_Loss
   From Sales
   Group By [Sub-Category]
   Having Sum(Profit) < 0
   Order By Profit_Loss ASC;

  -- Different discount and its avg profit
	  Select Discount,
	  Avg(Profit) As Average_Profit
	  From Sales
	  Group By Discount
	  Order BY Discount ASC;
	
-- Which region generating less revenue
Select Region,
Sum(Profit) AS Regionwise_Profit
From Sales
Group By Region
Order BY Regionwise_Profit ASC;

-- Find Top 5 sub categories by sales
Select TOP 5 [Sub-Category],Sales
From Sales
Order By Sales DESC;

-- Find Highest Sales, Profit, Best Margin Between Consumer, Corporate & Home Office 
Select Segment,
Sum(Sales) AS Total_Sales,
Sum(Profit) AS Total_Profit,
(Sum(Profit)/Sum(Sales)) * 100 AS Profit_Margin
From Sales
Group By Segment
Order By Profit_Margin DESC;

-- Which Region Generating Huge Loss 
Select Region, Sum(Profit) AS Profit_Loss
From Sales
Group By Region
Order By Profit_Loss Desc;

-- Which Ship Mode is most profitable
Select Top 1 [Ship Mode], Sum(profit) As Profit_ShipMode
From Sales
Group By [Ship Mode]
Order By Profit_ShipMode DESC;

-- Retreive Category wise Total Sales, Total Profit, Total Margin
Select [Category], 
Sum(Sales) AS Total_Sales, 
Sum(Profit) AS Total_Profit, 
Sum(Profit)/Sum(Sales)*100 AS Profit_Margin
From Sales
Group By Category
Order By Profit_Margin Desc;


