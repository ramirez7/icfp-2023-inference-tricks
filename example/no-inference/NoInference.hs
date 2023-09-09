module NoInference where

import Cleff
import Cleff.Reader

noInference :: Reader Int :> es => Eff es String
noInference = asks show
