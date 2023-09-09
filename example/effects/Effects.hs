module Effects where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)


{-
asks
  :: Reader r :> es
  => (r -> r')
  -> Eff es r'
asks f = fmap f ask
-}

noInference :: Reader [Int] :> es => Eff es Int
noInference = asks length
