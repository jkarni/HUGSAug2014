{-# LANGUAGE FlexibleInstances, UndecidableInstances #-}
class Print a where { print :: a -> String }

instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }
