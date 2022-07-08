--Sharar Sifat
--Queries used for Tableau Visualization


-- Sheet 1: Global numbers - total cases, total deaths, death percentage

Select SUM(new_cases) as total_cases, SUM(convert(int,new_deaths)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as death_percentage
From PortfolioProject..CovidDeaths
where continent is not null 
--Group By date
order by 1,2


-- Sheet 2: Continents vs Total Death Count

-- These are taken out as we're only concerned with continents


Select location, SUM(cast(new_deaths as int)) as total_death_count
From PortfolioProject..CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International', 'upper middle income','high income','lower middle income','low income')  
Group by location
order by total_death_count desc


-- Sheet 3: Countries vs Infected Population Percentage
--covid_percentage corresponds to infected population percentage

Select Location, Population, MAX(total_cases) as highest_infection_count,  Max((total_cases/population))*100 as covid_percentage
From PortfolioProject..CovidDeaths
Group by Location, Population
order by covid_percentage desc


-- Sheet 4: Graph showing actual vs forecasted covid data of several countries


Select Location, Population,date, MAX(total_cases) as highest_infection_count,  Max((total_cases/population))*100 as covid_percentage
From PortfolioProject..CovidDeaths
Group by Location, Population, date
order by covid_percentage desc
