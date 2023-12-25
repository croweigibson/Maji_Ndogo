# Maji Ndogo Water Access Analysis

## Introduction
The project focuses on one of the SDGs, access to water. The project aims to restore access to basic water services in a nation struggling with a water crisis. 
The survey also aims to identify the water sources people use and determine both the total and average number of users for each source.
Additionally, it examined the duration citizens typically spend in queues to access water
![](intro.jpeg)

## Description
This database contains the records of a water survey for the Integrated Project.

## Data model
The data model, including the column names, data types and feature descriptions, is included in the [Data_dictionary](Data_dictionary.pdf)

## Data Source
The [database](Md_water_services_data.xlsx) used includes more than 60 000 unique records and 43 columns.

## Modelling
The model is a star schema consisting of both dimension and facts tables.
![](model.png)

## Data Cleaning
Some of the tasks I performed in the initial phase include:
- update employees name
- update employees email and phone number
## Data Analysis
You can get the full SQL file [here](https://github.com/Crowei-Gibson/Maji_Ndogo/blob/main/Maji_Ndogo_Project.sql)

### What is the total population in Maji Ndogo?
Query                    |  Result
:-----------------------:|:-------------------------:
![](population.png)|![](pop_figure.png)

### How many water sources are available?
Query                        |  Result
:---------------------------:|:-------------------------:
![](type_of_water_source.png)|![](water_source_types.png)

### Average total queue time
Query                        |  Result
:---------------------------:|:-------------------------:
![](query8.png)|![](result8.png)

### What is the longest queue time?
Query                        |  Result
:---------------------------:|:-------------------------:
![](queue_times.png)|![](result_queue_times.png)

### Which locations have the longest queue times?
Query                        |  Result
:---------------------------:|:-------------------------:
![](queue.png)|![](location_queue_times.png)

## What is the water source percentage share?
Query                        |  Result
:---------------------------:|:-------------------------:
![](water_source_location_query.png)|![](water_source_by_location_type.png)

### Number of sources according to type
Query                        |  Result
:---------------------------:|:-------------------------:
![](query6.png)|![](result6.png)

### What are the pollution status of the wells?
Query                        |  Result
:---------------------------:|:-------------------------:
![](query_12.png)|![](result_12.png)

### Total number of people served per source
Query                        |  Result
:---------------------------:|:-------------------------:
![](query7.png)|![](result7.png)

### Aggregate queue times by day and hour
Query                        |  Result
:---------------------------:|:-------------------------:
![](query9.png)|![](result9.png)

### Percentage of people served by each source type in each province
Query                        |  Result
:---------------------------:|:-------------------------:
![](query_10.png)|![](result_10.png)

### Which town has the highest ratio of people who have taps but have no running water?
Query                        |  Result
:---------------------------:|:-------------------------:
![](query_11.png)|![](result_11.png)

## Results and Findings
1. There are 27million people in Maji Ndogo
2. Most water sources are rural.
3. 43% of the people are using shared taps. 2000 people often share one tap.
4. 31% of the population has water infrastructure in their homes, but within that group, 45% face non-functional systems due to issues with pipes,
pumps, and reservoirs.
5. 18% of our people are using wells of which, but within that, only 28% are clean..
6. Our citizens often face long wait times for water, averaging more than 120 minutes.
7. In terms of queues:
- Queues are very long on Saturdays.
- Queues are longer in the mornings and evenings.
- Wednesdays and Sundays have the shortest queue

## Recommendations 
1. Resources should be focused on improving the water sources that affect the most people.
- - Most people will benefit if we improve the shared taps first.
2. Wells are a good source of water, but many are contaminated. Fixing this will benefit a lot of people.
3. Fixing existing infrastructure will help many people. If they have running water again, they won't have to queue, thereby shorting queue times for others. This has the added benefit of solving two problems at once
4. Installing taps in homes will stretch resources too thin, so for now if the queue times are low, the source can be ignored.
5. Most water sources are in rural areas. So teams should take into account that costs for upgrades in those location will cost more. 

## Practical Solutions
1. If communities are using rivers, dispatch trucks to those regions to provide water temporarily in the short term. In the long term, send out crews to drill for wells, providing a more permanent solution. Sokoto is the first province we will target.
2. If communities are using wells, install filters to purify the water. For chemically polluted wells, install reverse osmosis (RO) filters, and for wells with biological contamination, we can install UV filters that kill microorganisms - but we should install RO filters too. In
the long term, we must figure out why these sources are polluted.
3. For shared taps, in the short term, we can send additional water tankers to the busiest taps, on the busiest days. We can use the queue time pivot table we made to send tankers at the busiest times. Meanwhile, we can start the work on installing extra taps where they are needed.
According to UN standards, the maximum acceptable wait time for water is 30 minutes. With this in mind, our aim is to install taps to get queue times below 30 min. Towns like Bello, Abidjan and Zuri have a lot of people using shared taps, so we will send out teams to those
towns first.
4. Shared taps with short queue times (< 30 min) represent a logistical challenge to further reduce waiting times. The most effective solution, installing taps in homes, is resource-intensive and better suited as a long-term goal.
5. Addressing broken infrastructure offers a significant impact even with just a single intervention. It is expensive to fix, but so many people can benefit from repairing one facility. For example, fixing a reservoir or pipe that multiple taps are connected to. We identified towns like Amina, Lusaka, Zuri, Djenne and rural parts of Amanzi seem to be good places to start.
