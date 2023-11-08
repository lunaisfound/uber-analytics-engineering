CREATE OR REPLACE TABLE `uber-analytics-lunark.uber_dataset.tbl_analytics` AS (
SELECT
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
td.trip_distance,
rc.RatecodeID,
rc.rate_code_name,
f.store_and_fwd_flag,
pl.pickup_latitude,
pl.pickup_longitude,
dl.dropoff_latitude,
dl.dropoff_longitude,
pt.payment_type,
pt.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM
`uber-analytics-lunark.uber_dataset.fact_table` f
JOIN `uber-analytics-lunark.uber_dataset.datetime_dim` d ON f.datetime_id = d.datetime_id
JOIN `uber-analytics-lunark.uber_dataset.passenger_count_dim` p ON f.passenger_count_id = p.passenger_count_id
JOIN `uber-analytics-lunark.uber_dataset.trip_distance_dim` td ON f.trip_distance_id = td.trip_distance_id
JOIN `uber-analytics-lunark.uber_dataset.rate_code_dim` rc ON f.rate_code_id = rc.rate_code_id
JOIN `uber-analytics-lunark.uber_dataset.pickup_location_dim` pl ON f.pickup_location_id = pl.pickup_location_id
JOIN `uber-analytics-lunark.uber_dataset.dropoff_location_dim` dl ON f.dropoff_location_id = dl.dropoff_location_id
JOIN `uber-analytics-lunark.uber_dataset.payment_type_dim` pt ON f.payment_type_id = pt.payment_type_id )
;
