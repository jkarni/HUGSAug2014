{-# LANGUAGE FlexibleInstances, UndecidableInstances, TypeFamilies, OverlappingInstances, FunctionalDependencies #-}
data T1
data T2

class Print a where
        print :: a -> String

class PrintHelper flag a | a -> flag where
        ph :: a -> String


instance           PrintHelper T1 Int where ph = show
instance           PrintHelper T1 String where ph = show
-- ...
instance Show a => PrintHelper T1 [a] where ph = show
-- ...

instance (T2 ~ f) => PrintHelper f a where ph = const "no show"
instance PrintHelper flag a => Print a where print = ph
