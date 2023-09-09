{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE DataKinds #-}

module ImpProof where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)
import GHC.List as List
import Imp

impInference :: '[Reader [Int], Reader String] :>> es => Eff es Int
impInference =
      (+)
  <$> withImpReader @[Int] (impAsks List.length)
  <*> withImpReader @String (impAsks List.length)
