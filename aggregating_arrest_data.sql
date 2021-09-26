Create table arrests
(
    ReportID bigint,
    ReportType varchar,
    ADate date,
    Tim time,
    AreaID int,
    AreaName varchar(100),
    RDistrict int,
    Age int,
    Sex char,
    Descent char,
    ChargeGrp int,
    ChargeGrpDesc varchar(100),
    ArrestCode char,
    Charge varchar(100),
    ChargeDesc varchar(150),
    DipositionDesc varchar(100),
    AAddress varchar(200),
    CrossStreet varchar(200),
    latitude numeric,
    longitude numeric,
    geoPoint varchar(50),
    bookingDate timestamp,
    bookingTime time,
    bookingLocation varchar(50),
    locationCode int

);

\copy arrests FROM 'C:\Users\Ariel\Downloads\Arrest_Data_from_2010_to_2019.csv' DELIMITER ',' CSV HEADER


--breaking up the data

--let's break it up by location, by age, by gender, by ethnicity and by offense:

drop table areaname_charge_type_arrests;
create table areaname_charge_type_arrests as (
select 
    count(reportid) as count_of_arrests,
    areaname,
    ChargeGrpDesc,
    avg(latitude) as latitude, 
    avg(longitude) as longitude 
    from arrests
where 
    ChargeGrpDesc is not Null
    and
    areaname is not Null

group by areaname, ChargeGrpDesc
order by count(reportid) desc);

drop table areaname_age_gender_descent_arrests;
create table areaname_age_gender_descent_arrests as (
select 
    count(reportid) as count_of_arrests,
    areaname,
    age,
    sex,
    descent,
    avg(latitude) as latitude, 
    avg(longitude) as longitude 
    from arrests
where 
    areaname is not Null
    and
    age is not Null
    and
    sex is not Null
    and
    descent is not Null
group by areaname, age, sex, descent
order by count(reportid) desc);


drop table areaname_date_time_charge_type_arrests;
create table areaname_date_time_charge_type_arrests as (
select 
    count(reportid) as count_of_arrests,
    areaname,
    ADate,
    --ntile(5) over (order by tim)
    --avg(Tim) over ntile(10),
    avg(tim) as average_arrest_time_by_day,
    ChargeGrpDesc,
    avg(latitude) as latitude, 
    avg(longitude) as longitude 
    from arrests
where 
    areaname is not Null
    and
    ADate is not Null
    and
    Tim is not Null
    and
    ChargeGrpDesc is not Null
group by areaname, ADate, ChargeGrpDesc
order by count(reportid) desc);

\copy areaname_charge_type_arrests to 'C:\Users\Ariel\Downloads\areaname_charge_type_arrests.csv' DELIMITER ',' CSV HEADER

\copy areaname_age_gender_descent_arrests to 'C:\Users\Ariel\Downloads\areaname_age_gender_descent_arrests.csv' DELIMITER ',' CSV HEADER

\copy areaname_date_time_charge_type_arrests to 'C:\Users\Ariel\Downloads\areaname_date_time_charge_type_arrests.csv' DELIMITER ',' CSV HEADER
