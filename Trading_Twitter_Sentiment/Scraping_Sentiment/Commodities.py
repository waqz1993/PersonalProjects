from TwitterScraperClass import TwitterScraper
usernames = ["BNCommodities", "ftcommodities"]
since_date = "2018-01-01"
until_date = "2022-12-31"
sector = 'Commodities'
twitter_commodity = TwitterScraper(usernames, since_date, until_date, sector).run().df_twitter
