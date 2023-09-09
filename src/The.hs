{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module The where

import Data.Kind
import GHC.TypeLits
import Cleff
import Cleff.Reader

type The fe a es = (HasOne fe a es, HasOnly fe a es)

class fe a :> es => HasOne (fe :: Type -> Effect) (a :: Type) (es :: [Effect]) | es fe -> a

-- Error handling:

class FoundTwice fe a b
instance TypeError
  ('Text "Found The " ':<>: 'ShowType fe ':<>: 'Text " twice:" ':$$:
   'Text "" ':$$:
   'Text "* " ':<>: 'ShowType (fe a) ':$$:
   'Text "* " ':<>: 'ShowType (fe b)
  ) => FoundTwice fe a b

instance HasNone fe a es => HasOne fe a (fe a : es)
instance {-# OVERLAPPABLE #-} HasOne fe a es => HasOne fe a (_1 : es)

class HasNone (fe :: Type -> Effect) (a :: Type) (es :: [Effect])

instance TypeError
  ('Text "Found The " ':<>: 'ShowType fe ':<>: 'Text " twice:" ':$$:
   'Text "" ':$$:
   'Text "* " ':<>: 'ShowType (fe a) ':$$:
   'Text "* " ':<>: 'ShowType (fe a)
  ) => HasNone fe a (fe a : es)

instance {-# OVERLAPPABLE #-} HasNone fe a es => HasNone fe a (_1 : es)

class HasOnly (fe :: Type -> Effect) (b :: Type)  (es :: [Effect])

instance TypeError
  ('Text "Found The " ':<>: 'ShowType fe ':<>: 'Text " twice:" ':$$:
   'Text "" ':$$:
   'Text "* " ':<>: 'ShowType (fe a) ':$$:
   'Text "* " ':<>: 'ShowType (fe b)
  ) => HasOnly fe b (fe a : es)

instance {-# OVERLAPS #-} HasOnly fe b es => HasOnly fe b (fe b : es)
instance {-# OVERLAPPABLE #-} HasOnly fe b es => HasOnly fe b (_1 : es)
instance HasOnly _1 _2 '[]

-- asks wrapper

asksThe :: forall r r' es. The Reader r es => (r -> r') -> Eff es r'
asksThe = asks @r

