{-# LANGUAGE FunctionalDependencies #-}
module Fundep where

class Monad m => MonadReader r m | m -> r where
  ask :: m r

asks
  :: MonadReader r m
  => (r -> r')
  -> m r'
asks f = fmap f ask

inferred :: MonadReader [Int] m => m Int
inferred = asks length
