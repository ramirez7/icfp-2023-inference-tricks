{-# LANGUAGE ImplicitParams #-}

module Imp where

import Data.Proxy

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
   . (?impReader :: Proxy r => k)
  -> k
withImpReader k = let ?impReader = Proxy @a in k
