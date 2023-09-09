module Dict where

import Data.Kind

data Dict (c :: Constraint) where
  Dict :: c => Dict c

instance Show (Dict c) where show _ = "Dict"
