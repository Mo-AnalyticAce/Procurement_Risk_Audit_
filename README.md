#Procurement_Risk_Audit_

## Project Overview
When a business faces delayed deliveries, rising costs, and unreliable suppliers, it loses money. This project takes raw company purchasing data and turns it into an easy-to-use business tool. The goal is to spot where the company is losing money, flag bad suppliers, and help management make smarter, data-backed choices.


##Business Problem
The purchasing team was working in the dark. They did not have a central way to see what was happening with their orders, which caused three big problems:

Uncontrolled Spending: Purchasing was done in a reactive way instead of planning ahead. Because tracking was messy, it was hard to catch incorrect billing, see exactly where the big money was going, or bundle orders together to get bulk discounts from suppliers.
Hidden Supplier Risks: There was no official scorecard to see which suppliers were doing a good job. Late deliveries and incomplete orders constantly slowed down internal teams, but these bad suppliers kept getting new orders because nobody was tracking their mistakes.
Workload Bottlenecks: Orders were not spread out evenly across the week. Instead, almost all requests came crashing in on Tuesdays and Wednesdays. This created a massive pile of paperwork for the team mid-week, while other days were completely slow.

##Project Objectives
To solve these problems, this project focuses on three main goals:

Stop Money Leaks: Build a central system to track all expenditures, making it easy to identify duplicate billing, find unnecessary costs, and discover opportunities for bulk-purchasing discounts.

Hold Suppliers Accountable: Create a clear performance tracking model to automatically flag late or cancelled shipments so the company can stop relying on risky vendors.

Smooth Out Operations: Use historical data patterns to balance the weekly processing workload, eliminating stressful mid-week pile-ups and speeding up order completion.

##Dataset Overview
The data used in this project connects five key areas of the business:

Vendors: List of suppliers, their names, and how risky they are to work with.
Items: The products being bought, their categories (like IT hardware or office supplies), and what they cost.
Departments: The internal company teams making the purchases.
Purchase Orders: The core tracking sheet showing order dates, expected delivery dates, and the current status of the order.
Invoicing: The financial records showing the final bill amounts, whether they have been paid, and the payment method used.

## Data Cleaning & Preparation
Before running the final business logic, a data preparation process was executed to ensure the queries would run smoothly without errors:

Filtering Incomplete Timelines: Blocked empty fields using WHERE order_date IS NOT NULL AND delivery_date IS NOT NULL to prevent errors when calculating shipping duration.

Standardizing Compliance Flags: Converted raw binary fields (1 and 0) into human-readable text labels ('YES' and 'No') using a conditional text check to make dashboard reporting easier for stakeholders to read.

Isolating Broken Records: Created a specific tracking filter to capture rows where the order status was marked "Delivered" but the actual arrival date field was left completely blank.

## Main Insights From the Data

Delivery Bottlenecks:The data shows that more than half of all orders end up delayed or cancelled. This is a massive problem that slows down the whole company.
Mid-Week Rush:Spending is heavily crammed into Tuesdays and Wednesdays. Mondays and Fridays see very little action, creating an unnecessary rush in the middle of the week.
Risky Suppliers: A deep dive shows that just a few specific suppliers are responsible for almost all the late deliveries. Relying on them too much is putting the company at risk.
Big Ticket Items: High-value technology hardware takes up the largest chunk of the budget. To pay for these, the company usually prefers using long-term billing agreements (like paying within 30 or 60 days) rather than paying upfront.

##  Simple Recommendations

Purchase Orders (Fixing Late Deliveries)

Set up a system that sends an automatic alert if a supplier doesn't confirm a shipping milestone on time. 
Also, try to move standard, routine orders to Thursdays and Fridays to stop the stressful mid-week rush.
Vendors (Dealing with Bad Suppliers)

Talk to the suppliers who are constantly late. Put strict rules in their contracts that penalize them financially for late shipments, and start moving some of your orders to backup suppliers who are more reliable.

 Items (Saving Money on Big Buys)

Since technology and equipment take up most of the budget, use these high numbers to negotiate long-term bulk contracts or special discounts to lower the cost per item.

 Invoicing (Improving Cash Flow)

Speed up how quickly your team double-checks bills. If you can verify and approve invoices faster, the company can take advantage of "early-bird" discounts that many suppliers offer.

### 5. Departments (Keeping Budgets in Check)

Give department managers a simple, automated view of their remaining monthly budget. This keeps them aware of how much money they have left before they submit large, expensive order requests.
