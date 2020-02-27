# Verticillium-wilt-Dataset
Data release provided in support of “Climatic drivers of Verticillium wilt in olive”

This README.txt file was generated on 2019/11/22 by Juan Miguel Requena-Mullor

-------------------
GENERAL INFORMATION
-------------------

This data release is provided in support of 

Juan M Requena-Mullor*, Mª del Mar Téllez, Jose M. García-Garrido, Pedro A García, Estefanía Rodríguez*. (Under review). "Climatic drivers of Verticillium wilt in olive".

First author*

This data release contains the data set used for the analysis described in the "Modelling approach" section of the associated manuscript.

Author's Information:

	Estefanía Rodríguez. Sustainable Crop Protection, Institute for Agricultural and Fisheries Research and Training (IFAPA), La Mojonera, Almería, Spain, mestefania.rodriguez@juntadeandalucia.es
	Juan Miguel Requena-Mullor. Department of Biological Sciences, Boise State University, 1910 W University Dr, Boise, ID 83725, juanmimullor@gmail.com


Date of data collection: from 2003-01-01 to 2005-12-31

Geographic location of data collection: Granada (Spain)

Information about funding sources or sponsorship that supported the collection of the data: This work was supported by Caja Rural Foundation in Granada, Spain. We would like to thank
farmers from Granada province for kindly permitting us to research their olive groves. We specially wish to thank Mr. Antonio León, chief executive officer of Caja Rural in Granada, for
encouraging this research.


--------------------------
SHARING/ACCESS INFORMATION
-------------------------- 

Licenses/restrictions placed on the data, or limitations of reuse: GNU GENERAL PUBLIC LICENSE; Version 3, 29 June 2007 (https://github.com/jmrmcode/Verticillium-wilt-Dataset/edit/master/LICENSE)


--------------------
DATA & FILE OVERVIEW
--------------------

Files list: VerticilliumWilt_DataSet.csv

Sources list: WorldClim v.2 database (http://www.worldclim.org/), Environmental Information Network of Andalusia (http://www.juntadeandalucia.es/medioambiente/site/web/rediam)

Date of creation: 2019-01-15


--------------------------
METHODOLOGICAL INFORMATION
--------------------------

Description of methods used for collection/generation of data: see the "Materials & Methods" section of the associated manuscript.

Software needed to interpret the data: R version 3.6.0 (2019-04-26) -- "Planting of a Tree" 

People involved with sample collection, processing, and submission: Estefanía Rodríguez and Juan Miguel Requena-Mullor


--------------------------
DATA-SPECIFIC INFORMATION
--------------------------

Number of variables: 9

Number of cases/rows: 779

List of variables:

		Occurrence: Occurrence of V. dahliae. Binary
		AnnualRainfall: Annual rainfall. Continuous
		RainfallSeasonality: Intra-annual rainfall seasonality. Continuous
		TempSeasonality: Intra-annual temperature seasonality. Continuous
		MaxTemp: Maximum temperature of the warmest month. Continuous
		Isothermality: (Mean diurnal temperature range/temperature annual range) x 100. Continuous
		Watering: Factorial variable with two levels: "Irrigated" and "Rainfed". Factorial
		PlantMaterialOrigin: Factorial variable with two levels: "Vivero" (Nursery) and "Estaca" (Annual pruning). Factorial
		Area: parcel area in ha. Continuous

All continuous variables were standardized to have a mean of zero and standard deviation of 1.
