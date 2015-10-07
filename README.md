# mp-activity
Open Data Book Club: mapping MP activity with Leaflet &amp; data from OpenParliament.ca

<h4>GIS workflow</h4>
All GIS functions were carried out in QGIS 2.10.1 unless otherwise noted.<br>
1. Downloaded shapefile of <a href="http://geogratis.gc.ca/api/en/nrcan-rncan/ess-sst/6d1d8f90-1c25-5fd0-880d-138d27c8cb57.html">Federal Electoral Districts from GeoGratis</a>, under <a href="http://open.canada.ca/en/open-government-licence-canada">Open Government License - Canada</a>.</br>
2. Deleted numerous fields to eliminate extra, non-essential data (e.g.: population numbers, deduping riding name, etc.).<br>
3. Simplified geometry from 1.2 million vertices to 67,067 to vastly reduce size of final GeoJSON.<br>
4. 
