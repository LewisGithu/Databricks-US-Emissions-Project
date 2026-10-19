SELECT
  `county_state_name`,
  `population`,
  SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE)) AS total_CO2_emissions,
  total_CO2_emissions / `population` AS emissions_per_person
FROM emissions_data
GROUP BY county_state_name, `population`
ORDER BY emissions_per_person DESC