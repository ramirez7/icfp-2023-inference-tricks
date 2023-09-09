{-# LANGUAGE DataKinds #-}
module TheProof where

import Cleff
import Cleff.Reader
import Cleff.State

import The

theInference :: Eff '[State Bool, Reader [Int], IOE] Int
--theInference :: The Reader [Int] es => Eff es Int
theInference = asksThe length
