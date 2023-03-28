import yfinance as yf
import pandas as pd


class StockDownloader:
    def __init__(self, stocks, start, end, size):
        self.stocks = stocks
        self.start = start
        self.end = end
        self.data = None
        self.size = size

    def download_data(self):
        dfs = []
        for stock in self.stocks:
            try:
                df = yf.download(tickers=[stock], start=self.start, end=self.end)
                df['Ticker'] = stock
                dfs.append(df)
            except Exception as e:
                print(f"Error downloading data for {stock}: {e}")
        self.data = pd.concat(dfs, axis=0)
        self.data['ListSize'] = self.size
