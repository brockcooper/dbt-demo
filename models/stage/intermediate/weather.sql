{{ config(tags=["on_deploy"]) }}

SELECT
    v:time::timestamp AS observation_time
    ,v:city.id::int AS city_id
    ,v:city.name::string AS city_name
    ,v:city.country::string AS country
    ,v:city.coord.lat::float AS city_lat
    ,v:city.coord.lon::float AS city_lon
    ,v:clouds.all::int AS clouds
    ,(v:main.temp::float)-273.15 AS temp_avg
    ,(v:main.temp_min::float)-273.15 AS temp_min
    ,(v:main.temp_max::float)-273.15 AS temp_max
    ,v:weather[0].main::string AS weather
    ,v:weather[0].description::string AS weather_desc
    ,v:weather[0].icon::string AS weather_icon
    ,v:wind.deg::float AS wind_dir
    ,v:wind.speed::float AS wind_speed
FROM data_lake_dev.helpers.json_weather_data
