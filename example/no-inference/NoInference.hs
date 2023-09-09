{-# LANGUAGE OverloadedRecordDot #-}
module NoInference where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)
import GHC.List as List

noInference :: Reader [Int] :> es => Eff es Int
noInference = asks List.length
