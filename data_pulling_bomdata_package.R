# https://github.com/mbertolacci/bomdata

# NOTE: It is not possible to extract data from this package. Need to identify the issue

# bomdata package in R

# Data obtaining through bomdata package
#devtools::install_github('mbertolacci/bomdata',force = TRUE)
library(bomdata)
#To initialise a new database

db_connection <- DBI::dbConnect(RSQLite::SQLite(), 'bomdata.db')
bomdata::initialise_db(db_connection)

# Listing all tables
DBI::dbListTables(db_connection)
DBI::dbListFields(db_connection,"bom_rainfall")

#Getting site data
site_data<-DBI::dbGetQuery(db_connection,"select * from bom_site")
site_data

# Get site numbers in NSW
site_numbers <- bomdata::get_site_numbers_in_region('NSW')

# Get the rainfall data from the site_number=3003

bomdata::add_site(db_connection, site_number = 3003)
site_data <- DBI::dbGetQuery(db_connection, '
    SELECT
        *
    FROM
        bom_site
')
print(head(site_data))


# Adding rainfall data

bomdata::add_daily_climate_data(db_connection, 3003, type = 'rainfall')

# rainfall data in the database

data <- DBI::dbGetQuery(db_connection, '
    SELECT
        *
    FROM
        bom_rainfall
    WHERE
        site_number = 3003
')
print(tail(data))
