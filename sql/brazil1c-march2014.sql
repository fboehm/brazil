insert overwrite local directory 'brazil-1c-tweets-march2014' -- OUTPUT FILE HERE

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
(LOWER(user.`location`) LIKE '%brazil%' OR 
LOWER(user.`location`) LIKE '%brasil%' OR
LOWER(user.`location`) LIKE '%acre%' OR 
LOWER(user.`location`) LIKE '%rio bravo%' OR
LOWER(user.`location`) LIKE '%alagoas%' OR 
LOWER(user.`location`) LIKE '%maceio%' OR
LOWER(user.`location`) LIKE '%amapa%' OR 
LOWER(user.`location`) LIKE '%macapa%' OR

LOWER(user.`location`) LIKE '%amazonas%' OR 
LOWER(user.`location`) LIKE '%manaus%' OR
LOWER(user.`location`) LIKE '%bahia%' OR 
LOWER(user.`location`) LIKE '%salvador%' OR
LOWER(user.`location`) LIKE '%ceara%' OR 
LOWER(user.`location`) LIKE '%fortaleza%' OR
LOWER(user.`location`) LIKE '%distrito federal%' OR 
LOWER(user.`location`) LIKE '%brasilia%' OR

LOWER(user.`location`) LIKE '%espirito santo%' OR 
LOWER(user.`location`) LIKE '%vitoria%' OR
LOWER(user.`location`) LIKE '%goias%' OR 
LOWER(user.`location`) LIKE '%goiania%' OR
LOWER(user.`location`) LIKE '%maranhao%' OR 
LOWER(user.`location`) LIKE '%sao luis%' OR
LOWER(user.`location`) LIKE '%mato grosso%' OR 
LOWER(user.`location`) LIKE '%cuiaba%' OR

LOWER(user.`location`) LIKE '%campo grande%' OR 
LOWER(user.`location`) LIKE '%minas gerais%' OR
LOWER(user.`location`) LIKE '%belo horizonte%' OR 
LOWER(user.`location`) LIKE '%para%' OR
LOWER(user.`location`) LIKE '%belem%' OR 
LOWER(user.`location`) LIKE '%paraiba%' OR
LOWER(user.`location`) LIKE '%joao pessoa%' OR 
LOWER(user.`location`) LIKE '%parana%' OR

LOWER(user.`location`) LIKE '%curitiba%' OR 
LOWER(user.`location`) LIKE '%pernambuco%' OR
LOWER(user.`location`) LIKE '%recife%' OR 
LOWER(user.`location`) LIKE '%piaui%' OR
LOWER(user.`location`) LIKE '%teresina%' OR 
LOWER(user.`location`) LIKE '%rio de janeiro%' OR
LOWER(user.`location`) LIKE '%rio grande do norte%' OR 
LOWER(user.`location`) LIKE '%natal%' OR

LOWER(user.`location`) LIKE '%rio grande do sul%' OR 
LOWER(user.`location`) LIKE '%porto alegre%' OR
LOWER(user.`location`) LIKE '%rondonia%' OR 
LOWER(user.`location`) LIKE '%porto velho%' OR
LOWER(user.`location`) LIKE '%roraima%' OR 
LOWER(user.`location`) LIKE '%boa vista%' OR
LOWER(user.`location`) LIKE '%santa catarina%' OR 
LOWER(user.`location`) LIKE '%florianopolis%' OR

LOWER(user.`location`) LIKE '%sao paulo%' OR 
LOWER(user.`location`) LIKE '%sergipe%' OR
LOWER(user.`location`) LIKE '%aracaju%' OR 
LOWER(user.`location`) LIKE '%tocantins%' OR
LOWER(user.`location`) LIKE '%palmas%' 
)

AND (
        	(LOWER(text) LIKE '%mae%') OR
	        (LOWER(retweeted_status.text) LIKE '%mae%') OR
        	(LOWER(text) LIKE '%gravid%') OR
	        (LOWER(retweeted_status.text) LIKE '%gravid%') OR
        	(LOWER(text) LIKE '%bebe%') OR
	        (LOWER(retweeted_status.text) LIKE '%bebe%') 
		)
AND 
month = 3
AND
year = 2014
)
