# SQL Join exercise
#
#
USE world;
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT name, population FROM city WHERE name LIKE 'ping%' ORDER BY population;
#
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT name, population FROM city WHERE name LIKE 'ran%' ORDER BY population DESC;
#
#
# 3: Count all cities
SELECT COUNT(*) FROM city;
#
#
# 4: Get the average population of all cities
SELECT AVG(population) FROM city;
#
#
# 5: Get the biggest population found in any of the cities
SELECT MAX(population) FROM city;
#
#
# 6: Get the smallest population found in any of the cities
SELECT MIN(population) FROM city;
#
#
# 7: Sum the population of all cities with a population below 10000
SELECT SUM(population) FROM city WHERE population < 10000;
#
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*) FROM city WHERE countrycode IN ('moz', 'vnm');
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT countrycode, COUNT(*) FROM city WHERE countrycode IN ('moz', 'vnm') GROUP BY countrycode;
#
#
# 10: Get average population of cities in MOZ and VNM
SELECT countrycode, AVG(population) FROM city WHERE countrycode IN ('moz', 'vnm') GROUP BY countrycode;
#
#
# 11: Get the countrycodes with more than 200 cities
SELECT countrycode, COUNT(*) FROM city GROUP BY countrycode HAVING COUNT(*) > 200;
#
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT countrycode, COUNT(*) FROM city GROUP BY countrycode HAVING COUNT(*) > 200 ORDER BY COUNT(*);
#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT name, language 
FROM city JOIN countrylanguage ON countrylanguage.countrycode = city.countrycode 
WHERE city.population BETWEEN 400 AND 500;
#
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT name, language 
FROM city JOIN countrylanguage ON countrylanguage.countrycode = city.countrycode 
WHERE city.population BETWEEN 500 AND 600;
#
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT resultcity.name
FROM city AS referencecity JOIN city AS resultcity ON referencecity.countrycode = resultcity.countrycode
WHERE referencecity.population = 122199; 
#I DON'T SEE WHY I WOULD DO IT THIS WAY, IT LOOKS OVERCOMPLICATED BUT I THOUGHT I SHOULD TRY TO USE 'JOIN'
#
#THIS IS HOW I WOULD DO IT
SELECT name FROM city WHERE countrycode = (SELECT countrycode FROM city WHERE population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT resultcity.name
FROM city AS referencecity JOIN city AS resultcity ON referencecity.countrycode = resultcity.countrycode
WHERE referencecity.population = 122199 AND resultcity.name != referencecity.name; 
#
SELECT name FROM city WHERE countrycode = (SELECT countrycode FROM city WHERE population = 122199) AND name != (SELECT name FROM city WHERE population = 122199);
#
# 17: What are the city names in the country where Luanda is capital?
SELECT country.name, city.name 
FROM city JOIN country ON city.countrycode = country.code 
WHERE country.capital = (SELECT id FROM city WHERE name = 'luanda');
#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT city.name
FROM city JOIN country ON city.id = country.capital
WHERE country.region = (SELECT country.region FROM country WHERE country.code = (SELECT city.countrycode FROM city WHERE name = 'yaren'));
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT countrylanguage.language 
FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code
WHERE country.region = (SELECT country.region FROM country WHERE country.code = (SELECT city.countrycode FROM city WHERE name = 'riga'));
#
#
# 20: Get the name of the most populous city
SELECT name FROM city WHERE population = (SELECT MAX(population) FROM city);
#
