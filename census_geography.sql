-- USAGE: psql -f census_geography.sql -d census
-- pg_dump -O -F c -f '/data/Dropbox (Optimus)/census/shapefiles/census_geography.dump' -W -t census_geography -d census

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;

CREATE TABLE IF NOT EXISTS census_geography (
    full_geoid character varying(16) PRIMARY KEY,
    full_name character varying(128) NOT NULL,
    sumlev character varying(3) NOT NULL,
    geo_type character varying(24) NOT NULL,
    region character varying(2),
    region_name character varying(24) NOT NULL,
    division character varying(2),
    division_name character varying(24) NOT NULL,
    statefp character varying(2),
    geoid character varying(24),
    cdfp character varying(12),
    cdsessn character varying(12),
    countyfp character varying(12),
    placefp character varying(12),
    classfp character varying(12) NOT NULL,
    sldlst character varying(12),
    sldust character varying(12),
    pcicbsa character varying(1),
    pcinecta character varying(1),
    csafp character varying(12),
    cbsafp character varying(12),
    metdivfp character varying(12),
    zcta5ce10 character varying(12),
    name character varying(128) NOT NULL,
    namelsad character varying(128) NOT NULL,
    lsad character varying(4),
    aland character varying(24),
    intptlat character varying(16) NOT NULL,
    intptlon character varying(16) NOT NULL,
    geom geometry(Geometry, 4269)
);

SELECT UpdateGeometrySRID('census_geography', 'geom', 4326);

\COPY census_geography FROM './generated_csv/all_geographies.csv' WITH CSV HEADER ENCODING 'latin1';
