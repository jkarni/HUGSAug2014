{-# LANGUAGE FlexibleInstances, FunctionalDependencies #-}
data T1
data T2

class Print a where
    print :: a -> String

class PrintHelper flag a | a -> flag where
        ph :: a -> String

instance Show a => PrintHelper T1 a
instance           PrintHelper T2 a

instance PrintHelper flag a => Print a where
        print = ph
