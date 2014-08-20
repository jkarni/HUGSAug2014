name: inverse
layout: true
class: center, middle, inverse
---
#Polycephaly
Or, multiplying instance heads

---
## The Problem
---
layout: false
.left-column[
  ## The Problem
]
.right-column[

```haskell
class Print a where { print :: a -> String }

instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }

```

]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[

```haskell
class Print a where { print :: a -> String }

instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }

```

```terminal
     Duplicate instance declarations:
      instance Show a => Print a -- Defined at ex1.hs:4:10
      instance Print a -- Defined at ex1.hs:5:20
Failed, modules loaded: none
```
]
 
---
 
.left-column[
  ## The Problem
]
.right-column[

```haskell
class Print a where { print :: a -> String }

instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }

```

```terminal
     Duplicate instance declarations:
      instance Show a => Print a -- Defined at ex1.hs:4:10
      instance Print a -- Defined at ex1.hs:5:20
Failed, modules loaded: none
```
Instance heads cannot match.
]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[

```haskell
class Print a where { print :: a -> String }

instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }

```

]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[

.small[
```haskell
class Print a where { print :: a -> String }

instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }
```
]
-------------
```haskell
--   Context/constraint          Class method
--          |                         |
--          ↓   ↱ Context arrow       ↓  
instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }
--                   ↑
--               Instance head
```
]

---
layout: false
.left-column[
  ## The Problem
]
.right-column[

```haskell
class A a
class B a
class C a 
class D a
instance (Show a) => A a where {...}
instance             A a where {...}
instance (A a)    => B a where {...}
instance             B a where {...}
instance (B a)    => C a where {...}
instance             C a where {...}
instance (C a)    => D a where {...}
instance             D a where {...}
```
]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[
```haskell
class A a
class B a
class C a 
class D a
instance (Show a) => A a where {...}
instance             A a where {...}
instance (A a)    => B a where {...}
instance             B a where {...}
instance (B a)    => C a where {...}
instance             C a where {...}
instance (C a)    => D a where {...}
instance             D a where {...}
```
]
![searchpath](img/searchpath.jpg)
---
layout: false
.left-column[
  ## The Problem
]
.right-column[
Which one to pick?
```haskell
instance P a => A a where { amethod = ...}
instance Q a => A a where { amethod = ...}
instance R a => A a where { amethod = ...}
```
]

---
layout: false
.left-column[
  ## The Problem
]
.right-column[
Which one to pick?
```haskell
instance P a => A a where { amethod = ...}
instance Q a => A a where { amethod = ...}
instance R a => A a where { amethod = ...}
```
Prolog's answer:
```prolog
A(a) :- P(a)
A(a) :- Q(a)
A(a) :- R(a)
```
]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[
Which one to pick?
```haskell
instance P a => A a where { amethod = ...}
instance Q a => A a where { amethod = ...}
instance R a => A a where { amethod = ...}
```
Prolog's answer: *The first*
```prolog
A(a) :- P(a)
A(a) :- Q(a)
A(a) :- R(a)
```

]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[
Which one to pick?
```haskell
instance P a => A a where { amethod = ...}
instance Q a => A a where { amethod = ...}
instance R a => A a where { amethod = ...}
```
Prolog's answer: *The first*
```prolog
A(a) :- P(a)
A(a) :- Q(a)
A(a) :- R(a)
```
But:
]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[
Which one to pick?
```haskell
instance P a => A a where { amethod = ...}
instance Q a => A a where { amethod = ...}
instance R a => A a where { amethod = ...}
```
Prolog's answer: *The first*
```prolog
A(a) :- P(a).
A(a) :- Q(a).
A(a) :- R(a).
```
But:

* Sometimes it matters.
]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[
Which one to pick?
```haskell
instance P a => A a where { amethod = ...}
instance Q a => A a where { amethod = ...}
instance R a => A a where { amethod = ...}
```
Prolog's answer: *The first*
```prolog
A(a) :- P(a).
A(a) :- Q(a).
A(a) :- R(a).
```
But:

* Sometimes it matters!

```prolog
A(X) :- P(X).
A(X) :- Q(X).
A(X) :- R(X).

P(alice).
Q(bob).
R(carol).

?- A(X).
```

]
---
layout: false
.left-column[
  ## The Problem
]
.right-column[
Which one to pick?
```haskell
instance P a => A a where { amethod = ...}
instance Q a => A a where { amethod = ...}
instance R a => A a where { amethod = ...}
```
Prolog's answer: *The first*
```prolog
A(a) :- P(a).
A(a) :- Q(a).
A(a) :- R(a).
```
But:
     
* Sometimes it matters.

```prolog
A(X) :- P(X).
A(X) :- Q(X).
A(X) :- R(X).

P(alice).
Q(bob).
R(carol).

?- A(X).
```
* And then this ends up looking too procedural!

]
---
name: inverse
layout: true
class: center, middle, inverse
---
# The Solution
---
layout: false
.left-column[
  ## The Solution
]
.right-column[
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a where { ... }

instance Show a => PrintHelper T1 a
instance           PrintHelper T2 a

instance PrintHelper flag a => Print a where { ... }
```
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a where { ... }

instance Show a => PrintHelper T1 a
instance           PrintHelper T2 a
                   -- vv --
instance PrintHelper flag a => Print a where { ... }
                   -- ^^ --
```
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a where { ... }

instance Show a => PrintHelper T1 a
instance           PrintHelper T2 a
                   -- vv --
instance PrintHelper flag a => Print a where { ... }
                   -- ^^ --
```
Ambiguous type!
]

---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a | a -> flag where { ... }

instance Show a => PrintHelper T1 a
instance           PrintHelper T2 a
 
instance PrintHelper flag a => Print a where { ... }
```
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a | a -> flag where { ... }
                            -- vvvv --
instance Show a => PrintHelper T1 a
instance           PrintHelper T2 a
                            -- ^^^^ --
instance PrintHelper flag a => Print a where { ... }
```
Functional dependency conflict!
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a | a -> flag where { ... }

instance           PrintHelper T1 Int
instance           PrintHelper T1 String
-- ...
instance Show a => PrintHelper T1 [a]
-- ...

instance           PrintHelper T2 a

instance PrintHelper flag a => Print a where { ... }
```
]

---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a | a -> flag where { ... }

instance           PrintHelper T1 Int
instance           PrintHelper T1 String
-- ...
instance Show a => PrintHelper T1 [a]
-- ...

instance (T2 ~ f) => PrintHelper f a

instance PrintHelper flag a => Print a where { ... }
```
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

* Add an extra parameter!

```haskell
data T1
data T2

class PrintHelper flag a | a -> flag where { ... }

instance           PrintHelper T1 Int
instance           PrintHelper T1 String
-- ...
instance Show a => PrintHelper T1 [a]
-- ...

instance (T2 ~ f) => PrintHelper f a

instance PrintHelper flag a => Print a where { ... }
```
# It compiles!
```terminal
[1 of 1] Compiling Main             ( ex3.hs, interpreted )
Ok, modules loaded: Main.
```
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[

### Runnable Code
```haskell
{-# LANGUAGE FlexibleInstances, 
             UndecidableInstances, 
             TypeFamilies, 
             OverlappingInstances, 
             FunctionalDependencies #-}
data T1
data T2

class Print a where
        print :: a -> String

class PrintHelper flag a | a -> flag where 
        ph :: a -> String


instance PrintHelper T1 Int where ph = show
instance PrintHelper T1 String where ph = show
-- ...
instance Show a => PrintHelper T1 [a] where ph = show
-- ...

instance (T2 ~ f) => PrintHelper f a where 
    ph = const "no show"
instance PrintHelper flag a => Print a where 
    print = ph
```
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[
### The Show Predicate
```haskell
data TTrue
data TFalse

class ShowPred a flag | a -> flag

instance ShowPred Int TTrue
instance ShowPred Bool TTrue
-- ...
instance ShowPred a flag => ShowPred Bool flag
-- ...
instance (TFalse ~ a) => ShowPred a flag

```
]
---
layout: false
.left-column[
  ## The Solution
]
.right-column[
### The Show Predicate
```haskell
data TTrue
data TFalse

class ShowPred a flag | a -> flag

instance ShowPred Int TTrue
instance ShowPred Bool TTrue
-- ...
instance ShowPred a flag => ShowPred Bool flag
-- ...
instance (TFalse ~ a) => ShowPred a flag

class PrintHelper flag a where
    ph :: flag -> a -> IO ()
 
instance (ShowPred a flag, PrintHelper flag a) => Print a where
    print = ph (undefined::flag)
 
```
]
