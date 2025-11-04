-- Analysis of the program --
-- The difficulty of this program comes not without programming the lists, but with
-- the condition that Ann couldn't play first
import Data.List (nub)
-- ### 2.1 Prime ### --
prime :: Int -> Bool
prime n
  = factors n == [1,n]
    where
    factors n
      = [f | f <- [1..n], n `mod` f == 0]

-- ### Primes ### --
-- An extra function for functionality
primes :: [Int]
primes = [3,5,7,11,13,17,19,23,29,31,37,41]

-- ### 2.2 Generator2 ### --
-- The instructions specified a list of lists, however this creates a type mismatch error when parsing
-- into the selector, so I have opted to change it to a list of tuples
generator2 :: [[Int]]
generator2 = [[a,b,c,d]
    | a <- primes,
      b <- primes, b > a,
      c <- primes, c > b, 
      d <- primes, d > c
    ]
    
initialHand :: [[Int]]
initialHand = [[x, y] | x <- primes, y <- primes, x < y, not (prime (3 + x + y))]


-- ### 2.3 Selector2 ### --
selector2 :: [Int] -> Bool
selector2 [a,b,c,d] = 
    let m = 3 + a + c 
        n = m + b + d 
    -- my struggle with the conditions of this function was that I couldn't find a way to clarify uniqueness, any is 
    -- insufficient and all obviously returns an empty list
    in prime m && prime n && any (\[x,y] -> length (nub [a,b,c,d,x,y]) == 6) initialHand

-- ### Main ### --
main :: IO()
main = 
    print (filter selector2 generator2)