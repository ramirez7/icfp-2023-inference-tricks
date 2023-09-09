{-# LANGUAGE OverloadedRecordDot #-}
module TheProof where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)

import The

theInference :: The Reader (Maybe Int) es => Eff es Bool
theInference = asksThe isJust
