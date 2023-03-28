from YF_PriceScraperClass_Crypto import CryptoDownloader
import pandas as pd
pd.set_option('display.max_columns', None)

cryptos = ['BTC-USD', 'ETH-USD', 'USDT-USD']
start = '2018-01-01'
end = '2021-12-31'

crypto_downloader = CryptoDownloader(cryptos, start, end)
data_Crypto = (crypto_downloader.download_data()).reset_index()
data_Crypto['sector'] = 'Crypto'
