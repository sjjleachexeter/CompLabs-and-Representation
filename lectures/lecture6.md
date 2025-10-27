# Polymorphism
`elem :: a -> [a] -> Bool`
using a as a placeholder for variable type
there are restrictions:
 - the a still has to hold in the code (you can't do `x == a` if a is a function for instance)
 
---

How do we resolve this?
>Type class constraints
`elem :: Eq a => a -> [a] -> Bool`
