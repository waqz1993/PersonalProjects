from Commodities import all_data_Commodity
from Crypto import data_Crypto
from Energy import all_data_Energy
from Technology import all_data_Technology
import pandas as pd

df = (pd.concat([all_data_Commodity, data_Crypto, all_data_Energy, all_data_Technology], axis=0))
df.to_csv("Price_Data.csv", index=False)
