[QueryItem="Task2.1"]
PREFIX : <https://example.com/nasa#>
PREFIX nas: <https://data.nasa.gov/ontologies/atmonto/NAS#>


SELECT ?name (str(?country) as ?label)

WHERE{
  ?x nas:airCarrierName  ?name;
  nas:countryOfRegistry ?country .
FILTER regex(?country, "^UK")

}

[QueryItem="Task2.2"]
PREFIX : <https://example.com/nasa#>
PREFIX nas: <https://data.nasa.gov/ontologies/atmonto/NAS#>

SELECT ?iataAirport ?iataAirline

WHERE{
  ?x nas:iataAirportCode  ?iataAirport;
     nas:iataCarrierCode ?iataAirline .
}

[QueryItem="Task2.3"]
PREFIX : <https://example.com/nasa#>
PREFIX nas: <https://data.nasa.gov/ontologies/atmonto/NAS#>
PREFIX gen: <https://data.nasa.gov/ontologies/atmonto/general#>

SELECT ?name ?long ?lat

WHERE{
  ?x nas:airportName ?name;
     gen:longitude ?long;
     gen:latitude ?lat .
  FILTER(?lat >18 && ?lat <32 && ?long >64 && ?long <80)
}
