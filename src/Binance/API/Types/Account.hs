{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE StrictData    #-}

module Binance.API.Types.Account
    ( Account(..)
    , Balance(..)
    , AccountTrade(..)
    ) where

import           Data.Aeson.Extended
import           Data.Text
import           GHC.Generics

--------------------------------------------------------------------------------

-- | Response type fo current account information
--  https://github.com/binance-exchange/binance-official-api-docs/blob/master/rest-api.md#account-information-user_data
data Account =
  Account
    { makerCommission  :: Int
    , takerCommission  :: Int
    , buyerCommission  :: Int
    , sellerCommission :: Int
    , canTrade         :: Bool
    , canWithdraw      :: Bool
    , canDeposit       :: Bool
    , updateTime       :: Int
    , balances         :: [Balance]
    } deriving (Show, Eq, Generic, FromJSON)

data Balance = Balance
    { asset  :: Text
    , free   :: Text
    , locked :: Text
    } deriving (Show, Eq, Generic, FromJSON)

-- | Response type to get trades for a specific account and symbol.
-- https://github.com/binance-exchange/binance-official-api-docs/blob/master/rest-api.md#account-trade-list-user_data
data AccountTrade =
  AccountTrade
    { id          :: Int
    , orderId     :: Int
    , price       :: Text
    , qty         :: Text
    , commission  :: Text
    , time        :: Int
    , isBuyer     :: Bool
    , isMaker     :: Bool
    , isBestMatch :: Bool
    } deriving (Show, Eq, Generic, FromJSON)
