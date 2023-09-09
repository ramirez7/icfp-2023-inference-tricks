{-# LANGUAGE OverloadedRecordDot #-}
module NoInference where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)

noInference :: Reader (Maybe Int) :> es => Eff es Bool
noInference = asks isJust
