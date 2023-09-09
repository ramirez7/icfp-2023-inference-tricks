module NoInference where

-- Multi-param type class..
class Monad m => MonadReader r m where
  ask :: m r

-- ..plus Polymorphic usage
asks
  :: MonadReader r m
  => (r -> r')
  -> m r'
asks f = fmap f ask

-- ..equals poor inference
noInference :: MonadReader [Int] m => m Int
noInference = asks length

-- Other common examples:
-- Function composition
-- Overloaded records/label
