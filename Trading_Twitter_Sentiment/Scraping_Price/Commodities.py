import pandas as pd
from YF_PriceScraperClass import StockDownloader

large_stocks = ['AVTR', 'CLF', 'FCX', 'MOS', 'NEM']
mid_stocks = ['X', 'CMC', 'MP', 'HL', 'EVA']
small_stocks = ['CDE', 'TMST', 'CMP', 'CENX', 'SCHN']
sector = 'Commodities'
start = '2018-01-01'
end = '2021-12-31'

# Download data for large-sized stocks
large_downloader = StockDownloader(large_stocks, start, end, 'Large')
large_downloader.download_data()

# Download data for mid-sized stocks
mid_downloader = StockDownloader(mid_stocks, start, end, 'Mid')
mid_downloader.download_data()

# Download data for small-sized stocks
small_downloader = StockDownloader(small_stocks, start, end, 'Small')
small_downloader.download_data()


all_data_Commodity = pd.concat([large_downloader.data, mid_downloader.data, small_downloader.data], axis=0
                               ).reset_index()
all_data_Commodity['sector'] = sector
