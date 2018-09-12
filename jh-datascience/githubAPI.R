## Use httr and jsonlite libraries
library(httr)
library(jsonlite)

## Use httr library function to get github OAuth endpoint
oauth_endpoints("github")

## Create app to authenticate to github
github_app <- oauth_app("github",
                        key = "8730fececeb342d3e3a3",
                        secret = "ca06ce5fac904c0fc0994b149b5677e1ce953a9b")

## Get OAuth 2 Token using app credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), github_app)

## Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

## Get repo data from the API
data <- content(req)

## Since retrieved data is a list, the follwing looks for
## repo named 'datasharing' and then prints the created date

for (i in 1:length(data)) {
     if (data[[i]]$name == "datasharing") {
          print(data[[i]]$created_at)
     }
}
