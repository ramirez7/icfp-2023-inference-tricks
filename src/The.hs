{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module The where

import Data.Kind
import GHC.TypeLits
import Cleff
import Cleff.Reader

-- Constraint holds if there is only one fe in es and it
-- is parameterized by a.
type The :: (Type -> Effect) -> Type -> [Effect] -> Constraint
type The fe a es = (HasOne fe a es, HasOnly fe a es)

---------------------------------------------------------
-- Search for (fe a)
--
-- * Fundep drives inference
-- * (:>) for free
class fe a :> es => HasOne (fe :: Type -> Effect) (a :: Type) (es :: [Effect]) | es fe -> a

-- Ensure there isn't a duplicate in the tail
instance HasNone fe a es => HasOne fe a (fe a : es)
instance {-# OVERLAPPABLE #-} HasOne fe a es => HasOne fe a (_1 : es)

---------------------------------------------------------
-- Fail if we find (fe a)
class HasNone (fe :: Type -> Effect) (a :: Type) (es :: [Effect])

instance TypeError
  ('Text "Found The " ':<>: 'ShowType fe ':<>: 'Text " twice:" ':$$:
   'Text "" ':$$:
   'Text "* " ':<>: 'ShowType (fe a) ':$$:
   'Text "* " ':<>: 'ShowType (fe a)
  ) => HasNone fe a (fe a : es)

instance {-# OVERLAPPABLE #-} HasNone fe a es => HasNone fe a (_1 : es)
instance HasNone fe a '[]

---------------------------------------------------------
-- Fail if we find some (fe a) that is not (fe b)
class HasOnly (fe :: Type -> Effect) (b :: Type) (es :: [Effect])

instance TypeError
  ('Text "Found The " ':<>: 'ShowType fe ':<>: 'Text " twice:" ':$$:
   'Text "" ':$$:
   'Text "* " ':<>: 'ShowType (fe a) ':$$:
   'Text "* " ':<>: 'ShowType (fe b)
  ) => HasOnly fe b (fe a : es)

instance {-# OVERLAPS #-} HasOnly fe b es => HasOnly fe b (fe b : es)
instance {-# OVERLAPPABLE #-} HasOnly fe b es => HasOnly fe b (_1 : es)
instance HasOnly _1 _2 '[]

---------------------------------------------------------
-- asks wrapper
asksThe :: forall r r' es. The Reader r es => (r -> r') -> Eff es r'
asksThe = asks @r

