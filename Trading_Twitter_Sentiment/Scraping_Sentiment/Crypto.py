from TwitterScraperClass import TwitterScraper
usernames = ["crypto", "ForbesCrypto"]
since_date = "2018-01-01"
until_date = "2022-12-31"
sector = 'Crypto'
twitter_crypto = TwitterScraper(usernames, since_date, until_date, sector).run().df_twitter
