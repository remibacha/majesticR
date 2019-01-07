#' @title Majestic URL -
#' @description This function provides all backlink data of an URL, including its CitationFlow, TrustFlow, and Root domain.
#'
#' @param url An URL you'd like to investigate.
#' @param api_key An identification key assigned to a user after subscribing to Majestic that is available via Profile page.
#'
#' @return majestic_url provides all backlink data of an URL
#'
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
#'
#' @examples
#'\dontrun{
#' url <- "https://dataseolabs.com/en/"
#' api_key <- "xxxxxxxxxxxxxxxxxxx"
#' majestic_domain(url, api_key)
#'}
#' @export


majestic_url <- function(url,api_key){

  api_request <- paste0("https://api.majestic.com/api/json?",
                        "app_api_key=",api_key,
                        "&cmd=GetIndexItemInfo",
                        "&items=1",
                        "&item0=",url,
                        "&datasource=fresh",
                        "&AddAllTopics=0")

  api_request <-URLencode(api_request, repeated = TRUE)
  majesticdata <- jsonlite::fromJSON(api_request, simplifyVector = TRUE)

  return(majesticdata$DataTables$Results$Data)

}
