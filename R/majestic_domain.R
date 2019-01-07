#' @title Majestic Domain
#' @description This function first extract the root domain from an URL, then provides all backlink data of the domain, including its CitationFlow, TrustFlow, and Root domain.
#'
#'
#' @param url An URL you'd like to investigate the domain data.
#' @param api_key An identification key assigned to a user after subscribing to Majestic that is available via Profile page.
#'
#' @return majestic_domain provides all backlink data of an URL
#'
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
#' @importFrom urltools domain
#' @importFrom urltools suffix_extract
#'
#' @examples
#'\dontrun{
#' url <- "https://dataseolabs.com/en/"
#' api_key <- "xxxxxxxxxxxxxxxxxxx"
#' majestic_domain(url, api_key)
#'}
#' @export


majestic_domain <- function(url,api_key){

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

  return(majesticdata$DataTables$Results$Data)

}
