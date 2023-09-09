module Fundep where

class Monad m => MonadReader m r | m -> r where
  ask :: m r

asks
  :: MonadReader
  => (r -> r')
  -> Eff es r'
asks f = fmap f ask

inferred :: MonadReader m [Int] => m Int
inferred = asks length
