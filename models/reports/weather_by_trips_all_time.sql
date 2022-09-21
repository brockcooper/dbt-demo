{{ config(tags=["on_deploy", "every_hour"]) }}

SELECT 
     w.weather AS conditions
    ,COUNT(*) AS num_trips
FROM data_lake_dev.transportation.trips AS t
    LEFT OUTER JOIN {{ ref('weather') }} AS w
        ON DATE_TRUNC('hour', w.observation_time) = DATE_TRUNC('hour', t.starttime)
WHERE conditions IS NOT NULL
GROUP BY 1 
ORDER BY 2 DESC