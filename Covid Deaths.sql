SELECT *
FROM CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4
--Select the data that we are going to be using
SELECT location,date,total_cases,new_cases,total_deaths,population
FROM CovidDeaths
ORDER BY 1,2


--looking at total cases vs total deaths
--shows the percentage of dying if you attract covid in your country
SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM CovidDeaths
WHERE location LIKE '%lebanon%'
ORDER BY location,date



--looking at total cases vs population
--shows percentage of population that got covid
SELECT location,date,population,total_cases, (total_cases/population)*100 AS DeathPercentage
FROM CovidDeaths
WHERE location LIKE '%lebanon%'
ORDER BY location,date



--looking at countries with highest infection rate compared to population
SELECT location,population,MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentOfPopulationInfected
FROM CovidDeaths
--WHERE location LIKE '%lebanon%'
GROUP BY population,location
ORDER BY PercentOfPopulationInfected DESC



--showing countries with the highest death count per population
SELECT location,MAX(CAST(total_deaths AS INT)) AS TotalDeathCount 
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC


--showing continents with highest death count
SELECT location,MAX(CAST(total_deaths AS INT)) AS TotalDeathCount 
FROM CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

--this shows north america as all of america, because
--of the null values in the excel sheet, so we use the query above
SELECT continent,MAX(CAST(total_deaths AS INT)) AS TotalDeathCount 
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC


--Global Numbers
SELECT SUM(new_cases) AS TotalCases, SUM(cast(new_deaths AS INT)) AS TotalDeaths, SUM(cast(new_deaths AS INT))/SUM
(new_cases)*100 AS DearthPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1,2

--to view day by day
SELECT date,SUM(new_cases) AS TotalCases, SUM(cast(new_deaths AS INT)) AS TotalDeaths, SUM(cast(new_deaths AS INT))/SUM
(new_cases)*100 AS DearthPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2


 
