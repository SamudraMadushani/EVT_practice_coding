#' Get station meta data from GHCN-Daily (defaults to Australia)
#'
#' @param country_id (default is AS for Australia)
#' @param network_id (default is N for Australia Bureau of Meteorology)
#' @return Returns the Australia station meta data for all possible stations
#'
wrapper_get_meta_data <- function(country_id = "AS", network_id = "N"){

  ghcnd_meta_data = ghcnd_stations()
  as_meta_data = dplyr::filter(ghcnd_meta_data,
                               substr(id, 1, 2) == country_id & substr(id, 3, 3) == network_id)

  return(as_meta_data)

}
