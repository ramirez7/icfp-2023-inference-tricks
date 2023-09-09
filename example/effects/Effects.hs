{-# LANGUAGE DataKinds #-}

module Effects where

import Cleff
import Cleff.Reader
import Cleff.State

noInference :: Eff '[State Bool, Reader [Int], IOE] Int
--noInference :: Reader [Int] :> es => Eff es Int
noInference = asks length

{-
asks
  :: Reader r :> es
  => (r -> r')
  -> Eff es r'
asks f = fmap f ask
-}

