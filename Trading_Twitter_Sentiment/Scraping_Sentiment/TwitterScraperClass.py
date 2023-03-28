import pandas as pd
import snscrape.modules.twitter as sntwitter
import datetime as dt


class TwitterScraper:
    def __init__(self, usernames, since_date, until_date, sector):
        self.usernames = usernames
        self.since_date = since_date
        self.until_date = until_date
        self.sector = sector
        self.tweets = []
        self.df_twitter = None

    def scrape_tweets(self):
        for username in self.usernames:
            try:
                for tweet in sntwitter.TwitterSearchScraper(
                        f"from:{username} since:{self.since_date} until:{self.until_date}").get_items():
                    self.tweets.append([tweet.rawContent, tweet.date, username])
            except Exception as e:
                print(f"Error scraping tweets for {username}: {e}")
        self.df_twitter = pd.DataFrame(self.tweets, columns=['content', 'date', 'username'])

    def adjust_date(self, date):
        if date.time() < dt.time(13):
            date = date - dt.timedelta(days=1)
        return date.date()

    def preprocess_data(self):
        self.df_twitter['date'] = self.df_twitter['date'].apply(self.adjust_date)
        self.df_twitter['sector'] = self.sector

    def run(self):
        self.scrape_tweets()
        self.preprocess_data()
        return self
