# majesticR

### Description

Implements methods for querying backlink data from Majestic using its API. 
Majestic API uses a basic authentication with an API key. 
This package is used in the "[Do You Need Backlinks for SEO?](https://remibacha.com/en/backlinks-r/)" tutorial (french version: ["Avez-vous vraiment besoin de backlinks ?"](https://remibacha.com/fr/backlinks/)).


## Install
```
#CRAN R (official version)
install.packages("majesticR")

#Github (dev version)
devtools::install_github("remibacha/majesticR")
```

## Getting started
Get your Majestic API key (you will have to replace the "xxxxxxxxxxxxxxxxxxx" in above examples with it) and load the majesticR package :
```
library(majesticR)
```

## Main majesticR Functions

### 1. majestic_url()
This function provides all backlink data of an URL, including its CitationFlow, TrustFlow, and Root domain.
```
url <- "https://dataseolabs.com/en/"
api_key <- "xxxxxxxxxxxxxxxxxxx"
majestic_domain(url, api_key)
```

### 2. majestic_domain()
This function first extract the root domain from an URL, then provides all backlink data of the domain, including its CitationFlow, TrustFlow, and Root domain.

```
url <- "https://dataseolabs.com/en/"
api_key <- "xxxxxxxxxxxxxxxxxxx"
majestic_domain(url, api_key)
```

### 3. majestic_all()
This function provides both all backlink data of and URL and its roots domain, including its CitationFlow, TrustFlow, and Root domain.
```
url <- "https://dataseolabs.com/fr/"
api_key <- "xxxxxxxxxxxxxxxxxxx"
majestic_all(url, api_key)
```

## Feedbacks
Questions and feedbacks welcome!

You want to contribute ? Open a pull request ;-) If you encounter a bug or want to suggest an enhancement, please open an issue.
