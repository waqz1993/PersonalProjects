from Commodities import twitter_commodity
from Crypto import twitter_crypto
from Energy import twitter_energy
from Technology import twitter_tech
import pandas as pd

df = (pd.concat([twitter_commodity, twitter_crypto, twitter_energy, twitter_tech], axis=0))
df.to_csv("Twitter_Data.csv", index=False)
