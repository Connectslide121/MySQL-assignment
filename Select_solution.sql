# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: city
# Columns: Id,name,countryCode,District,population
#
# Table: country
# Columns: Code, name, Continent, Region, SurfaceArea, indepyear, population, LifeExpectancy, GNP, Capital
#
# Table: countryLanguage
# Columns: countryCode, Language, IsOfficial,Percentage
#
#
USE world;
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
SELECT "hello world" as message , 123 as id;
#
# 2: Get everything from the city table
# (Hint: Many many rows)city
SELECT * FROM city;
#
#
# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
SELECT * FROM city WHERE district = 'aceh';
#
#
# 4: Get only the name of the cities where the countrycode is "bfa"
SELECT name FROM city WHERE countrycode = 'bfa';
#
#
# 5: Get both the name and district of the cities where the countrycode is "tto"
SELECT name, district FROM city WHERE countrycode = 'tto';
#
#
# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
SELECT name AS nm, district AS dist FROM city WHERE countrycode = 'arm';
#
#
# 7: Get the cities with a name that starts with "bor"
SELECT * FROM city WHERE name LIKE 'bor%';
#
#
# 8: Get the cities with a name that contains the string "orto"
SELECT * FROM city WHERE name LIKE '%orto';
#
#
# 9: Get the cities that has a population below 1000
SELECT * FROM city WHERE population < 1000;
#
#
# 10: Get the unique countrycodes from the cities that has a population below 1000
SELECT DISTINCT countrycode FROM city WHERE population < 1000;
#
#
# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
SELECT * FROM city WHERE countrycode = 'ukr' AND population > 1000000;
#
#
# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
SELECT * FROM city WHERE population < 200 OR population > 9500000;
#
#
# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
SELECT * FROM city WHERE countrycode = 'tjk' OR countrycode = 'mrt' OR countrycode = 'and' OR countrycode = 'png' OR countrycode = 'sjm';
SELECT * FROM city WHERE countrycode IN ('tjk', 'mrt', 'and', 'png', 'sjm');
#
#
# 14: Get the cities with a population between 200 and 700 inclusive
SELECT * FROM city WHERE population >= 200 AND population <= 700;
SELECT * FROM city WHERE population BETWEEN 200 AND 700;
#
#
# 15: Get the countries with a population between 8000 and 20000 inclusive
SELECT * FROM country WHERE population >= 8000 AND population <= 20000;
SELECT * FROM country WHERE population BETWEEN 8000 AND 20000;
#
#
# 16: Get the name of the countries with a independence year (indepyear) before year 0
SELECT name FROM country WHERE indepyear < 0;
#
#
# 17: Get the countries that has no recorded independence year and a population above 1000000
SELECT * FROM country WHERE indepyear IS NULL AND population > 1000000;
#
#
# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
SELECT * FROM country WHERE surfacearea < 10 AND lifeexpectancy IS NOT NULL;
#
