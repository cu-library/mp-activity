# mp-activity
Open Data Book Club: mapping MP activity with Leaflet &amp; data from OpenParliament.ca

## Data 

TBD

## GIS workflow

All GIS functions were carried out in QGIS 2.10.1 unless otherwise noted.

1. Downloaded shapefile of <a href="http://geogratis.gc.ca/api/en/nrcan-rncan/ess-sst/6d1d8f90-1c25-5fd0-880d-138d27c8cb57.html">Federal Electoral Districts (FEDs) from GeoGratis</a>, under <a href="http://open.canada.ca/en/open-government-licence-canada">Open Government License - Canada</a>.</br>
2. Deleted numerous fields to eliminate extra, non-essential data (e.g.: population numbers, deduping riding name, etc.).<br>
3. Simplified geometry from 1.2 million vertices to 67,067 to vastly reduce size of final GeoJSON.<br>
4. Deduped riding data from database so that only one record per FED. Added field to document changes in party and/or member since 2011 election.<br>
5. Joined riding data to shapefile.<br>
6. GeoJSON exported from QGIS did not function properly with Leaflet code so exported from QGIS as KML, uploaded to CartoDB, deleted extra KML fields, exported as GeoJSON that actually worked.<br>
7. Manually replaced ridiculous symbols in riding names with actual proper letters (ô, é, etc.) using NotePad.

## Leaflet

