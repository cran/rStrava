#' get latitude and longitude from Google polyline
#'
#' get latitude and longitude from Google polyline 
#' 
#' @param polyline a map polyline returned for an activity from the API
#' @param key chr string of Google API key for elevation data, passed to \code{\link[googleway]{google_elevation}}
#' @author Daniel Padfield, Marcus Beck
#' @concept token
#' @return dataframe of latitude and longitudes with a column for the unique identifier
#' @examples
#' \dontrun{
#' stoken <- httr::config(token = strava_oauth(app_name, app_client_id, app_secret, cache = TRUE))
#' 
#' my_acts <- get_activity_list(stoken)
#' acts_data <- compile_activities(my_acts)
#' 
#' # get lat and lon for a single activity
#' polyline <- acts_data$map.summary_polyline[[1]]
#' get_latlon(polyline, key = mykey)
#' }
#' @export
get_latlon <- function(polyline, key){

	out <- googleway::google_elevation(polyline = polyline, key = key)
	
	# sanity check
	if('error_message' %in% names(out))
		stop(out$error_message)
	
	out <- out %>% 
		.[['results']] %>% 
		dplyr::mutate(
			lat = location$lat, 
			lon = location$lng
		) %>% 
		dplyr::select(-location, -resolution) %>% 
		dplyr::rename(ele = elevation)
	
	return(out)

}
