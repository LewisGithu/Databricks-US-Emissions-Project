SELECT
  county_state_name,
  sum(population) county_population,
  SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE)) AS total_CO2_emissions,
  SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE)) / SUM(`population`) AS emissions_per_person
FROM emissions_data
GROUP BY county_state_name
ORDER BY total_co2_emissions DESC
LIMIT 10