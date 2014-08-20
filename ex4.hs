{-# LANGUAGE ScopedTypeVariables, FlexibleInstances, UndecidableInstances, TypeFamilies, OverlappingInstances, FunctionalDependencies #-}
data TTrue
data TFalse

class ShowPred a flag | a -> flag

instance ShowPred Int TTrue
instance ShowPred Bool TTrue
-- ...
instance ShowPred a flag => ShowPred [a] flag
-- ...
instance (flag ~ TFalse) => ShowPred a flag

class PrintHelper flag a where
    ph :: flag -> a -> String


instance Show a => PrintHelper TTrue a where
   ph _ = show
instance PrintHelper TFalse a where
   ph _ = const "No show method"

class Print a where
    print :: a -> String

instance (ShowPred a flag, PrintHelper flag a) => Print a where
    print = ph (undefined::flag)
