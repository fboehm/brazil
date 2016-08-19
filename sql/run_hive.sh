hive -hiveconf OUTPUT_DIR='brazil1b-january2014' -hiveconf MONTH=1 -hiveconf YEAR=2014 -f brazil1b.sql
hive -hiveconf OUTPUT_DIR='brazil1b-february2014' -hiveconf MONTH=2 -hiveconf YEAR=2014 -f brazil1b.sql
hive -hiveconf OUTPUT_DIR='brazil1b-january2015' -hiveconf MONTH=1 -hiveconf YEAR=2015 -f brazil1b.sql
hive -hiveconf OUTPUT_DIR='brazil1b-february2015' -hiveconf MONTH=2 -hiveconf YEAR=2015 -f brazil1b.sql

