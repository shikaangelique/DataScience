-- Summary Statistics
SELECT MIN(population) AS 'Min population',
       MAX(population) AS 'Max population',
       MIN(population_growth) AS 'Min pop growth',
       MAX(population_growth) AS 'Max pop growth'
    FROM facts;


/*To note:
There's a country with a population of 0 & another with population of
7256490011 which is approximately the world population so that's concerning.*/
SELECT name, area, population
    FROM facts
    WHERE population > (SELECT AVG(population)
                       FROM facts
                      WHERE name <> 'World'
                        )
    AND area < (SELECT AVG(area)
                 FROM facts
                WHERE name <> 'World'
                );

-- Average Population and Area
SELECT AVG(population), AVG(area)
    FROM facts
    WHERE NOT name is 'World';


/*
    Densely populated countries:
    These are defined as countries that have:
      - Population above the average value.
      - Area below average value
 */
SELECT name, population, area
    FROM facts
    WHERE population > (SELECT AVG(population)
                            FROM facts
                            WHERE NOT name is 'World')
    AND area < (SELECT AVG(area)
                    FROM facts
                    WHERE NOT name is 'World');