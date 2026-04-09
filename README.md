# PlatinumRx Data Analyst Assignment

This repository contains my solutions for the PlatinumRx Data Analyst Assignment. The assignment covers three core skills - SQL, Python and Spreadsheets.

## Task Breakdown

### Phase 1 - SQL

**Hotel Management System**
- Created tables for users, bookings, items and booking_commercials
- Wrote queries to find last booked room per user, monthly billing amounts, most and least ordered items, and second highest bill per month

**Clinic Management System**
- Created tables for clinics, customers, clinic_sales and expenses
- Wrote queries to find revenue by sales channel, top 10 customers, monthly profit and loss, and most profitable clinics by city and state

### Phase 2 - Spreadsheets

- Created ticket and feedbacks sheets with sample data
- Used INDEX/MATCH formula to pull ticket created date into feedbacks sheet using cms_id as the common key
- Added same_day and same_hour helper columns to check if tickets were created and closed on same day and same hour
- Created outlet wise summary table using COUNTIFS formula

### Phase 3 - Python

**01_Time_Converter.py**
- Takes total minutes as input
- Converts it into hours and minutes format
- Example: 130 minutes becomes 2 hrs 10 minutes

**02_Remove_Duplicates.py**
- Takes a string as input
- Removes all duplicate characters using a for loop
- Example: hello becomes helo

## Tools Used

- MySQL for SQL queries
- Python 3 for scripting
- Google Sheets for spreadsheet tasks

## Spreadsheet Link

[Click here to view Ticket Analysis Sheet](https://docs.google.com/spreadsheets/d/1ibYH-u65NB9TxKxuGEBXcOf3XKzp8i5lg2gA7ZfxBSs/edit?usp=sharing)

## Notes

- All SQL queries are written using basic joins and subqueries
- Python scripts use simple loops and basic operators as required
- Sample data is included in the schema files for testing purposes
