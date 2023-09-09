{-# LANGUAGE TypeApplications #-}
module Explicit where

import Cleff
import Cleff.Reader

explicit :: Reader [Int] :> es => Eff es Int
explicit = asks @[Int] length
