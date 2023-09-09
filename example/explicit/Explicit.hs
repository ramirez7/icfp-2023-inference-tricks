{-# LANGUAGE TypeApplications #-}
module Explicit where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)

explicit :: Reader [Int] :> es => Eff es Int
explicit = asks @[Int] length
