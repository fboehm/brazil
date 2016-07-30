insert overwrite local directory 'output/160511_sustain_2015' -- OUTPUT FILE HERE

row format delimited
fields terminated by "\t"

SELECT

id_str,
user.id_str,
created_at,
regexp_replace(user.name, "[ \t\r\n]+", " "),
regexp_replace(user.description, "[ \t\r\n]+", " "),

regexp_replace(text, "[ \t\r\n]+", " "),

coordinates.coordinates[0],
coordinates.coordinates[1],
coordinates.type,

entities.hashtags.text,

place.bounding_box.coordinates[0][0][0],
place.bounding_box.coordinates[0][0][1],
place.bounding_box.coordinates[0][1][0],
place.bounding_box.coordinates[0][1][1],
place.bounding_box.coordinates[0][2][0],
place.bounding_box.coordinates[0][2][1],
place.bounding_box.coordinates[0][3][0],
place.bounding_box.coordinates[0][3][1],

regexp_replace(user.`location`, "[ \t\r\n]+", " "),
user.time_zone,
user.utc_offset,
regexp_replace(user.lang, "[ \t\r\n]+", " "),

retweeted_status.id_str,
retweeted_status.user.id_str,
retweeted_status.created_at,
regexp_replace(retweeted_status.user.name, "[ \t\r\n]+", " "),
regexp_replace(retweeted_status.user.description, "[ \t\r\n]+", " "),

regexp_replace(retweeted_status.text, "[ \t\r\n]+", " "),

retweeted_status.coordinates.coordinates[0],
retweeted_status.coordinates.coordinates[1],
retweeted_status.coordinates.type,

retweeted_status.entities.hashtags.text,

retweeted_status.place.bounding_box.coordinates[0][0][0],
retweeted_status.place.bounding_box.coordinates[0][0][1],
retweeted_status.place.bounding_box.coordinates[0][1][0],
retweeted_status.place.bounding_box.coordinates[0][1][1],
retweeted_status.place.bounding_box.coordinates[0][2][0],
retweeted_status.place.bounding_box.coordinates[0][2][1],
retweeted_status.place.bounding_box.coordinates[0][3][0],
retweeted_status.place.bounding_box.coordinates[0][3][1],

regexp_replace(retweeted_status.user.`location`, "[ \t\r\n]+", " "),
retweeted_status.user.time_zone,
retweeted_status.user.utc_offset,
regexp_replace(retweeted_status.user.lang, "[ \t\r\n]+", " ")


FROM gh_rc2

WHERE (

month = 3
AND
year = 2015
)
