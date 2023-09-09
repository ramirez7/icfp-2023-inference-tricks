{-# LANGUAGE OverloadedRecordDot #-}
module NoInference where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)

noInference :: Reader [Int] :> es => Eff es Int
noInference = asks length
