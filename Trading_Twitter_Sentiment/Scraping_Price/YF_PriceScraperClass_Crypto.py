import yfinance as yf
import pandas as pd


class CryptoDownloader:

    def __init__(self, cryptos, start, end):
        self.cryptos = cryptos
        self.start = start
        self.end = end
        self.data = None

    def download_data(self):
        dfs = []
        for crypto in self.cryptos:
            try:
                df = yf.download(tickers=[crypto], start=self.start, end=self.end, group_by='Ticker')
                df['Ticker'] = crypto
                dfs.append(df)
            except Exception as e:
                print(f"Error downloading data for {crypto}: {e}")
        self.data = pd.concat(dfs, axis=0)
        self.data['ListSize'] = 'N/A'
        return self.data
