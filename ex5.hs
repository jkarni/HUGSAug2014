{-# LANGUAGE ScopedTypeVariables, FlexibleInstances, UndecidableInstances, TypeFamilies, OverlappingInstances, FunctionalDependencies #-}
data TShow
data TOrd
data TNone

class WhichClass a flag | a -> flag

instance WhichClass Int TOrd
instance WhichClass Bool TShow
-- ...
instance WhichClass a flag => WhichClass [a] flag
-- ...
instance (flag ~ TNone) => WhichClass a flag

class PrintHelper flag a where
    ph :: flag -> a -> String


instance Show a => PrintHelper TShow a where
   ph _ = show
instance Ord a => PrintHelper TOrd a where
   ph _ = const "Is Ord"
instance PrintHelper TNone a where
   ph _ = const "Not Show or Ord"

class Print a where
    print :: a -> String

instance (WhichClass a flag, PrintHelper flag a) => Print a where
    print = ph (undefined::flag)
