#' @title Majestic All
#' @description This function provides both all backlink data of and URL and its roots domain, including its CitationFlow, TrustFlow, and Root domain.
#'
#'
#' @param url An URL you'd like to investigate.
#' @param api_key An identification key assigned to a user after subscribing to Majestic that is available via Profile page.
#'
#' @return majestic_all provides all backlink data of an UR
#'
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
#' @importFrom urltools domain
#' @importFrom urltools suffix_extract
#'
#' @examples
#'\dontrun{
#' url <- "https://dataseolabs.com/fr/"
#' api_key <- "xxxxxxxxxxxxxxxxxxx"
#' majestic_all(url, api_key)
#'}
#' @export


majestic_all <- function(url,api_key){

  #Get root domain data
  domain_name <- domain(url)
  domain_info <- suffix_extract(domain_name)
  root_domain <- paste0(domain_info$domain,".",domain_info$suffix)

  api_request <- paste0("https://api.majestic.com/api/json?",
                        "app_api_key=",api_key,
                        "&cmd=GetIndexItemInfo",
                        "&items=1",
                        "&item0=",root_domain,
                        "&datasource=fresh",
                        "&AddAllTopics=0")

  api_request <-URLencode(api_request, repeated = TRUE)
  majesticdata <- jsonlite::fromJSON(api_request, simplifyVector = TRUE)
  domain_data <- majesticdata$DataTables$Results$Data
  colnames(domain_data) <- paste0("DOMAIN_", colnames(domain_data))

  #Get URL data
  api_request <- paste0("https://api.majestic.com/api/json?",
                        "app_api_key=",api_key,
                        "&cmd=GetIndexItemInfo",
                        "&items=1",
                        "&item0=",url,
                        "&datasource=fresh",
                        "&AddAllTopics=0")

  api_request <-URLencode(api_request, repeated = TRUE)
  majesticdata <- jsonlite::fromJSON(api_request, simplifyVector = TRUE)
  url_data <- majesticdata$DataTables$Results$Data

  all_data <- data.frame(c(domain_data, url_data))
  return(all_data)

}
