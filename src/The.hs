{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module The where

import Data.Kind
import GHC.TypeLits
import Cleff
import Cleff.Reader

class fe a :> es => The (fe :: Type -> Effect) (a :: Type) (es :: [Effect]) | es fe -> a

instance HasNone a fe es => The fe a (fe a : es)
instance {-# OVERLAPPABLE #-} The fe a es => The fe a (_1 : es)

-- Type error when we have duplicates:

class HasNone (b :: Type) (fe :: Type -> Effect) (es :: [Effect])

instance TypeError
  ('Text "Found The " ':<>: 'ShowType fe ':<>: 'Text " twice:" ':$$:
   'Text "" ':$$:
   'Text "* " ':<>: 'ShowType (fe a) ':$$:
   'Text "* " ':<>: 'ShowType (fe b)
  ) => HasNone b fe (fe a : es)
instance {-# OVERLAPPABLE #-} HasNone b fe es => HasNone b fe (_1 : es)
instance HasNone _1 _2 '[]

-- asks wrapper

asksThe :: forall r r' es. The Reader r es => (r -> r') -> Eff es r'
asksThe = asks @r

