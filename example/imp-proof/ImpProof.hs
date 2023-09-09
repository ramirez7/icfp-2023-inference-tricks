{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE DataKinds #-}

module ImpProof where

import Cleff
import Cleff.Reader
import Data.Maybe (isJust)
import Imp

impInference :: '[Reader [Int], Reader String] :>> es => Eff es Int
impInference =
      (+)
  <$> withImpReader @[Int] (impAsks length)
  <*> withImpReader @String (impAsks length)
