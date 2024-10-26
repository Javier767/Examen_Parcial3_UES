insert into DimTiempo
select date_key, full_date, day_name, day_of_week, day_num_in_month, 
[month], month_name, week_num_in_year, [quarter], weekday_flag, [year]
from Date_Dimension

