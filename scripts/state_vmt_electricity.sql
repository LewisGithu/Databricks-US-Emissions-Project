SELECT
  state_abbr,
  MAX(CAST(REPLACE(`vehicle miles traveled (miles/capita)`, ',', '') AS DOUBLE)) AS vmt_per_capita,
  SUM(CAST(REPLACE(`consumption (MWh)`, ',', '') AS DOUBLE)) AS total_consumption_mwh,
  SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE)) AS total_CO2_emissions,
  SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE))
    / MAX(`population`) AS emissions_per_person
FROM emissions.default.emissions_data
GROUP BY state_abbr
ORDER BY
  emissions_per_person DESC