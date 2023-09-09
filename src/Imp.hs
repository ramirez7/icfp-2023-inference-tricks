{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Imp where

import Data.Proxy
import Cleff
import Cleff.Reader

type ImpReader r = (?impReader :: Proxy r)

impAsks
  :: forall r r' es
   . (?impReader :: Proxy r)
  => Reader r :> es
  => (r -> r')
  -> Eff es r'
impAsks = asks

withImpReader
  :: forall r k
   . (ImpReader r => k)
  -> k
withImpReader k = let ?impReader = Proxy @r in k
