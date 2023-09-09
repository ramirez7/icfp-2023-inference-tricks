{-# LANGUAGE OverloadedRecordDot #-}
module TheProof where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)
import GHC.List as List

import The

theInference :: The Reader [Int] es => Eff es Int
theInference = asksThe List.length
