from TwitterScraperClass import TwitterScraper
usernames = ["technology", "fttechnews"]
since_date = "2018-01-01"
until_date = "2022-12-31"
sector = 'Technology'
twitter_tech = TwitterScraper(usernames, since_date, until_date, sector).run().df_twitter
