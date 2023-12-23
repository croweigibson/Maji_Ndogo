# Maji Ndogo Water Access Analysis

## Introduction
The project focuses on one of the SDGs, access to water. The project aims to restore access to basic water services in a nation struggling with a water crisis. 
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

### Total number of people served per source
Query                        |  Result
:---------------------------:|:-------------------------:
![](query7.png)|![](result7.png)