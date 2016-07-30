library(twitteR)
load("~/Dropbox/credentials/my_oauth")
setup_twitter_oauth(my_oauth$consumerKey, my_oauth$consumerSecret)
twitteR::searchTwitter("")



# working with dplyr databases vignette

my_db <- src_sqlite("", create = FALSE)