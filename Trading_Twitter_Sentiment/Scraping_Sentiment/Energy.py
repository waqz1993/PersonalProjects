from TwitterScraperClass import TwitterScraper
usernames = ["BloombergNRG", "ftenergy"]
since_date = "2018-01-01"
until_date = "2022-12-31"
sector = 'Energy'
twitter_energy = TwitterScraper(usernames, since_date, until_date, sector).run().df_twitter
