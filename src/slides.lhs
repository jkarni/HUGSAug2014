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
                 -- vvv ---
instance Show a => Print a where { print = show }
instance           Print a where { print = "No show" }
                 -- ^^^ ---
```

{{content}}
]
--

```terminal
     Duplicate instance declarations:
      instance Show a => Print a -- Defined at ex1.hs:4:10
      instance Print a -- Defined at ex1.hs:5:20
Failed, modules loaded: none
```
--
Instance heads cannot match.

--- 
