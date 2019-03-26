[QueryItem="Task2.1"]
PREFIX : <https://example.com/nasa#>
PREFIX nas: <https://data.nasa.gov/ontologies/atmonto/NAS#>


SELECT ?name (str(?country) as ?label)

WHERE{
  ?x nas:airCarrierName  ?name;
  nas:countryOfRegistry ?country .
FILTER regex(?country, "^UK")

}
