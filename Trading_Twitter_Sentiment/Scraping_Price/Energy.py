import pandas as pd
from YF_PriceScraperClass import StockDownloader

large_stocks = ['COP', 'SLB', 'EOG', 'EPD', 'MPC']
mid_stocks = ['OVV', 'DINO', 'DCP', 'NOV', 'AR']
small_stocks = ['CEIX', 'CRGY', 'OII', 'ESTE', 'RES']
sector = 'Energy'
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


all_data_Energy = pd.concat([large_downloader.data, mid_downloader.data, small_downloader.data], axis=0
                            ).reset_index()
all_data_Energy['sector'] = sector
