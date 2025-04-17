The above screenshots are explained below:

screenshot0 is the first output after creating the employee dataset

screenshot1 is the output after using the LAG() and LEAD() functions to compare chosen columns with previous and next records 

screenshot2 is the output after using the DENSE_RANK query to rank record within a category

screenshot3 is the output after ranking salaries from each department

screenshot4 is the output after retrieving the first 2 employees in each department basing on their joining date

screenshot5 is the output after displaying all records from the employee table


REAL LIFE USE OF THESE WINDOW FUNCTIONS:

LAG & LEAD : Tracks how salaries are increasing or decreasing for roles or see score progression in exams

RANK & DENSE_RANK: used in competitions, leaderboards, or salary benchmarking

Identifying top 3 records per category: get top performing employees, top selling products, highest rated students etc...

Finding the earliest records per category: Get the first customers, early employees or initial product launches per category

Aggregation with window functions: show how individuals compare to their team or company-wide benchmarks
