library(twitteR)
load("~/Dropbox/credentials/my_oauth")
setup_twitter_oauth(my_oauth$consumerKey, my_oauth$consumerSecret)
twitteR::searchTwitter("")



