module NoInference where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)


{-
asks
  :: Reader r :> es
  => (r -> s)
  -> Eff es s
-}

noInference :: Reader [Int] :> es => Eff es Int
noInference = asks length
