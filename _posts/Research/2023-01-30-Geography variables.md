---
layout: post
title:  "Geography variables in US"
tags: Research
mathjax: on
---
## Introduction
Doing research, especially in the field of economics, works with the geography variables very frequently. However, different data-maintaining authorities have defined their geography division by themselves, which creates a lot of misunderstanding and friction in doing research. This page helps you to understand the target division and provides detailed information about it.

[Here](https://www.census.gov/newsroom/blogs/random-samplings/2014/07/understanding-geographic-relationships-counties-places-tracts-and-more.html) are some resources from the Census Bureau.

## [Public Use Microdata Areas (PUMAs)](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/pumas.html)
Public Use Microdata Areas (PUMAs) are non-overlapping, statistical geographic areas that partition each state or equivalent entity into geographic areas containing no fewer than 100,000 people each. They cover the entirety of the United States, Puerto Rico, and Guam. The Census Bureau defines PUMAs for the tabulation and dissemination of decennial census and American Community Survey (ACS) Public Use Microdata Sample (PUMS) data. Additionally, the ACS and Puerto Rico Community Survey use them to disseminate their respective period estimates.

In different time the PUMA will change. Until now there are several version:
- 2020
- 2010

## [ZIP Code Tabulation Areas (ZCTAs)]
A ZIP Code is a postal code used by the United States Postal Service (USPS).
ZIP Code Tabulation Areas (ZCTAs) are based on the U.S. Postal Services ZIP Codes and must fall within the national boundary only. Many data users think that ZCTAs must stay within the state boundary, but in a few cases, **ZCTAs can cross into bordering states.**


## [Core Based Statistical Areas (CBSAs)]
Core Based Statistical Areas (CBSAs) (metropolitan/micropolitan statistical areas) fall within the nation and **often cross state lines.**
A core-based statistical area (CBSA) is a U.S. geographic area defined by the Office of Management and Budget (OMB) that consists of one or more counties (or equivalents) anchored by an urban center of at least 10,000 people plus adjacent counties that are socioeconomically tied to the urban center by commuting. Areas defined on the basis of these standards applied to the 2000 census data were announced by OMB in June 2003. These standards are used to replace the definitions of metropolitan areas that were defined in 1990. The OMB released new standards based on the 2010 census on July 15, 2015.
CBSAs are subdivided into 
* metropolitan statistical area MSAs (formed around urban areas of at least 50,000 in population) 
* micropolitan statistical areas (μSAs), which are CBSAs built around an urban cluster of at least 10,000 in population but less than 50,000 in population.

## [Federal Information Processing System (FIPS)](https://transition.fcc.gov/oet/info/maps/census/fips/fips.txt)
FIPS codes are numbers which uniquely identify geographic areas. The number of digits in FIPS codes vary depending on the level of geography. State-level FIPS codes have two digits, county-level FIPS codes have five digits of which the first two are the FIPS code of the state to which the county belongs.

## [Public Use Microdata Areas (PUMAs)](https://www.census.gov/programs-surveys/geography/guidance/geo-areas/pumas.html)
Public Use Microdata Areas (PUMAs) are non-overlapping, statistical geographic areas that partition each state or equivalent entity into geographic areas containing no fewer than 100,000 people each. They cover the entirety of the United States, Puerto Rico, and Guam. The Census Bureau defines PUMAs for the tabulation and dissemination of decennial census and American Community Survey (ACS) Public Use Microdata Sample (PUMS) data.

## Commuting Zone
A commuting zone is a geographic area used in population and economic analysis. In addition to the major use of urban areas, it may be used to define rural areas which share a common market. Commuting zones are clusters of counties that are characterized by strong commuting ties within CZs, and weak commuting ties across CZs. 
[David Dorn @ University of Zurich](https://www.ddorn.net/data.htm) has been working on this issue for long.
> [E] Local Labor Market Geography
> Commuting Zones (CZs) provide a local labor market geography that covers the entire land area of the United States. CZs are clusters of U.S. counties that are characterized by strong within-cluster and weak between-cluster commuting ties. **The variable afactor indicates which fraction of a SEA/County Group/PUMA maps to a given CZ.**
Several useful crosswalks includes:
* [E4](https://www.ddorn.net/data/cw_puma1990_czone.zip) a probabilistic matching of sub-state geographic units in U.S. Census Public Use Files, PUMAs to CZs
* [E6](https://www.ddorn.net/data/cw_puma2010_czone.zip) 2010 Census and 2012-ongoing ACS Public Use Micro Areas to 1990 Commuting Zones.
* [E7](https://www.ddorn.net/data/cw_cty_czone.zip) 1990 Counties to 1990 Commuting Zones.

The variable CZs is widely applied in economic research and therefore crosswalk is needed. Here David Dorn already provide the crosswalk between 2010 PUMAs to 1990 CZs and 1990 FIPs to 1990 CZs. Other crosswalks can be found as followed:
* [F1](/doc/data/2010FIPS2010PUMA.csv) 2010 FIPS (Census Tract) to 2010 PUMAs, orginal file can be found from [Census Bureau](https://www.census.gov/geographies/reference-files/time-series/geo/relationship-files.2010.html#list-tab-PPI15NZCP5058MKZN6)
* [F2](/doc/data/2000PUMA2010PUMA.xlsx) 2010 PUMA to 2000 PUMA crosswalk, original file can be found from [IPUMS](https://usa.ipums.org/usa/volii/pumas10.shtml#crosswalk)
* [F3](/doc/data/2010CBSA2010FIPS.dta) 2010 CBSA(MSA/μSA) to 2010 FIPS, original file can be found from [NBER](https://www.nber.org/research/data/census-core-based-statistical-area-cbsa-federal-information-processing-series-fips-county-crosswalk) or most up-to-date from [Census Bureau](https://www.census.gov/geographies/reference-files/time-series/demo/metro-micro/delineation-files.html)

## Examples/Projects
This section shows the current project I am conducting and brief log information about the geo variables used and file resources.

### China shocks on substance
The project "China shocks on substance" investigate the impacts from China's import to local employment then to local helth outcomes including substance use. Healthcare outcomes data set includes TEDS-A, HCUP NIS and Behavioral Risk Factors Surveillance System (BRFSS).

### China shock
The information about China shocks is from David Dorn, which is mentioned above. The geography variables using in the China shock paper is commuting zones. 

### [TEDS-A and TEDS-D](https://www.samhsa.gov/data/data-we-collect/teds-treatment-episode-data-set)
Treatment Episode Data set Admissions (TEDS-A), from Substance Abuse and Mental Health Services Administration (SAMHSA), U.S. Department of Health and Human Services (HHS). 

TEDS-A records the admissions, and TEDS-D records the discharges. The two data sets are separate but linkable. TEDS-A data collection began in 1992, and TEDS-D began in 2000. These data sets include: Data for individuals who are 12 years old or older, Records for an admission or discharge, not for individual people, Demographic information, such as age, sex, race/ethnicity, and employment status, Substance abuse characteristics, such as substances used, age at first use, route of use, frequency of use, and number of previous admissions.

The dataset we are using is TEDS-A 1992, 2001 and 2011. The main geography variables using in TEDS-A is CBSA. The following section shows the variable listed in each of the data set.
* TEDS-A 1992
    CBSA, labeled FIPS 2000 CBSA code
* TEDS-A 2001/2011
    CBSA2010, labeled CBSA 2010 code

Crosswalks: to closely match TEDS-A data set to commuting zones, we need to match the geography from **2000/2010 CBSA to FIPS/PUMA then to CZs.** We are planning to use the following crosswalks to map three years CBSAs to commuting zones.
1. 2000 CBSA to FIPS, the crosswalk is using ["June 2003 Counties with metropolitan and micropolitan statistical area codes"](https://www.census.gov/geographies/reference-files/time-series/demo/metro-micro/historical-delineation-files.html)
2. 2010 CBSA to FIPS, the crosswalk is using [F3](/doc/data/2010CBSA2010FIPS.dta)
3. [E7](https://www.ddorn.net/data/cw_cty_czone.zip) 1990 Counties to 1990 Commuting Zones. (Notes: FIPS have been changing not very common.)

### HCUP NIS

* HCUP NIS 2001
    HOSPSTCO: Hospital modified FIPS state/county code
    