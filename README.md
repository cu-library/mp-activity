# Open Data Book Club: Mapping MP Votes

We used data from [OpenParliament.ca](https://openparliament.ca/) and [Leaflet](http://leafletjs.com/) to map MP votes in the most recent session of parliament, session 41-2. Use the slider (created with [Leaflet-Slider](https://github.com/Eclipse1979/leaflet-slider)) to highlight MPs who are more/less present for House votes.

[Members of 41st Parliament, Second Session: Who Voted?](http://cu-library.github.io/mp-activity/)

## Data

* [Bulk data](https://openparliament.ca/data-download/) (Postgres `pg_dump` output, updated August 2015) downloaded from OpenParliament.ca
* Data loaded in PostgreSQL database created w/ [Postgres.app](http://postgresapp.com/)
* [Aggregated MP vote counts](./session-41-2-MP-votes.sql) in session 41-2 and associated with federal electoral district IDs.

## GIS workflow

All GIS functions were carried out in <a href="http://www.qgis.org/en/site/">QGIS 2.10.1</a> unless otherwise noted. Workflow below reflects the ideal sequence of events and not the experimental reality.

1. Downloaded shapefile of <a href="http://geogratis.gc.ca/api/en/nrcan-rncan/ess-sst/6d1d8f90-1c25-5fd0-880d-138d27c8cb57.html">Federal Electoral Districts (FEDs) from GeoGratis</a>, under <a href="http://open.canada.ca/en/open-government-licence-canada">Open Government License - Canada</a>.</br>
2. Deleted numerous fields to eliminate extra, non-essential data (e.g.: population numbers, deduping riding name, etc.).<br>
3. Simplified geometry from 1.2 million vertices to 67,067 to vastly reduce size of final GeoJSON.<br>
4. Deduped riding data from database so that only one record per FED. Added field to document changes in party and/or member since 2011 election.<br>
5. Joined riding data to shapefile based on FED ID numbers.<br>
6. GeoJSON exported from QGIS did not function properly with Leaflet code so exported from QGIS as KML, uploaded to CartoDB, deleted extra KML fields, exported as GeoJSON that actually worked.<br>
7. Manually replaced ridiculous symbols in riding names with actual proper letters (ô, é, etc.) using NotePad.

## Leaflet

* Create map, add tile layer, and load GeoJSON.
* For each FED in GeoJSON data, apply style according to party colour & attach popup w/ MP details.
* Add a slider control to filter MPs by vote attendance.

## To do
* add animation to ridings updated on slider change. (Huge differences in riding sizes makes changes in small ridings hard to see.)
* add information about votes where MP is absent. (Some House votes more important than [others](https://openparliament.ca/bills/41-2/S-218/).)
* map data sets showing most agreeable / contrarian MPs (most/least likely to vote on party lines)
