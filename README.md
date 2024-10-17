# Maji Ndogo Water Access Analysis

## Project Background

The Maji Ndogo project focuses on one of the United Nations Sustainable Development Goals: access to clean water. In this initiative, I analyzed a dataset consisting of real-world data and AI-generated data to evaluate the current state of water access in Maji Ndogo, a nation experiencing a severe water crisis. My analysis aimed to identify the number of households with access to basic water services, the condition of existing water infrastructures, and areas requiring new installations.

I utilized SQL, dashboards, conditional formatting, and aggregation functions to clean, analyze, and summarize the insights below, which were presented to the stakeholders to guide restoration efforts.


<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/5o890y4g2hazubyfvm5h.jpeg" alt="Fig 1: AI-Generated Image of the fictional Maji_Ndogo Community" width="100%" />


## Data Structures & Intitial Checks

The project's main data structure as seen below consists of seven tables namely: employee, location, water_quality, visits, well_pollution, water_source, and global_water_access.

Here is the entity relationship diagram:

![Maji_Ndogo_ERD](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/l5sf22q64v2wsk06w226.png)

You can view the data in greater detail [here](https://github.com/croweigibson/Maji_Ndogo/tree/main/excel)

## Executive Summary

### Overview of Findings

Insights and recommendations are provided in the following key areas:

**Population Density**: A look at the population count of Maji Ndogo and the number of people affected by lack of water access. 
**Queue Times Analysis**: 
**Water Source Analysis**: 
**Cost Analysis**:
**Well Status**:
**Crime Gender Disparity**:

## Data Cleaning

Some of the tasks I performed in the initial phase include:
- update employees name
- update employees' email and phone number

## Data Analysis

You can get the full SQL file [here](https://github.com/Crowei-Gibson/Maji_Ndogo/blob/main/Maji_Ndogo_Project.sql)

### What is the total population in Maji Ndogo?

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/2lxy0unh7dnk56ve17uj.png" alt="Fig 3: Total Population Figure" width="100%" />

### How many water sources are available?

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/n61pw9u6mbv9qvmhts7z.png" alt="Fig 4: Types of Water Sources Available" width="100%" />


### Average total queue time

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/v93cwyku70tiij2egohp.png" alt="Fig 5: Average Total Queue Times" width="100%" />


### What is the longest queue time?

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/tcez6yg5mb6cc0w94mww.png" alt="Fig 6: Longest Queue Times" width="100%" />


### Which locations have the longest queue times?

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/oa3e0k514gtddkrk7eob.png" alt="Fig 7: Queue Times by Location" width="100%" />


## What is the water source percentage share?

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/mpemy73lvh3lnrvowjo9.png" alt="Fig 8: Water Source by Location" width="100%" />


### Number of sources according to type

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/vdw785nel7657gytew24.png" alt="Fig 9: Number of Sources" width="100%" />


### What are the pollution status of the wells?

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1xnlthqezgkrffh8b6xb.png" alt="Fig 10: Pollution Status of Wells" width="100%" />


### Total number of people served per source

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/75gqtoae1al3su8g0bme.png" alt="Fig 11: People Served Per Source" width="100%" />


### Aggregate queue times by day and hour

<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1din2mn1p1stde97sann.png" alt="Fig 12: Aggregate Queue Times" width="100%" />

### Percentage of people served by each source type in each province


<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/3y5b2w97yzonr9z72dlt.png" alt="Fig 13: People Served Per Source" width="100%" />


### Which town has the highest ratio of people who have taps but have no running water?


<img src="https://dev-to-uploads.s3.amazonaws.com/uploads/articles/12038z4p0s07gid6ezkm.png" alt="Fig 14: Town with Highest Ratio of Taps" width="100%" />



## Results and Findings
1. There are 27million people in Maji Ndogo

2. Most water sources are rural.

3. 43% of the people are using shared taps. 2000 people often share one tap.

4. 31% of the population has water infrastructure in their homes, but within that group, 45% face non-functional systems due to issues with pipes, pumps, and reservoirs.

5. 18% of our people are using wells of which, but within that, only 28% are clean.

6. Our citizens often face long wait times for water, averaging more than 120 minutes.

7. In terms of queues:
- Queues are very long on Saturdays.
- Queues are longer in the mornings and evenings.
- Wednesdays and Sundays have the shortest queue

## Recommendations 
1. Resources should be focused on improving the water sources that affect the most people.

- Most people will benefit if the shared taps are improved first.

2. Wells are a good source of water, but many are contaminated. Fixing this will benefit a lot of people.

3. Fixing existing infrastructure will help many people. If they have running water again, they won't have to queue, thereby shorting queue times for others. This has the added benefit of solving two problems at once.

4. Installing taps in homes will stretch resources too thin, so for now, if the queue times are low, the source can be ignored.

5. Most water sources are in rural areas. So, teams should take into account that costs for upgrades in those locations will cost more. 

## Practical Solutions

1. If communities are using rivers, dispatch trucks to those regions to provide water temporarily in the short term. In the long term, send out crews to drill for wells, providing a more permanent solution. Sokoto is the first province we will target.

2. If communities are using wells, install filters to purify the water. For chemically polluted wells, install reverse osmosis (RO) filters, and for wells with biological contamination, we can install UV filters that kill microorganisms - but we should install RO filters too. In
the long term, we must figure out why these sources are polluted.

3. For shared taps, in the short term, we can send additional water tankers to the busiest taps on the busiest days. We can use the queue time pivot table we made to send tankers at the busiest times. Meanwhile, we can start the work on installing extra taps where they are needed. According to UN standards, the maximum acceptable wait time for water is 30 minutes. With this in mind, our aim is to install taps to get queue times below 30 min. Towns like Bello, Abidjan and Zuri have a lot of people using shared taps, so we will send out teams to those towns first.

4. Shared taps with short queue times (< 30 min) represent a logistical challenge to further reduce waiting times. The most effective solution, installing taps in homes, is resource-intensive and better suited as a long-term goal.

5. Addressing broken infrastructure offers a significant impact even with just a single intervention. It is expensive to fix, but so many people can benefit from repairing one facility. For example, fixing a reservoir or pipe that multiple taps are connected to. We identified towns like Amina, Lusaka, Zuri, Djenne, and rural parts of Amanzi seem to be good places to start.
