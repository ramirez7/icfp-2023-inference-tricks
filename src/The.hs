{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module The where

import Data.Kind
import GHC.TypeLits
import Cleff

class fe a :> es => The (fe :: Type -> Effect) (es :: [Effect]) (a :: Type) | es fe -> a

instance HasNone a fe es => The fe (fe a : es) a
instance {-# OVERLAPPABLE #-} The fe es a => The fe (_1 : es) a

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



