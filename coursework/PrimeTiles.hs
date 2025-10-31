-- Analysis of the program --
-- The difficulty of this program comes not without programming the lists, but with
-- the condition that Ann couldn't play first

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
generator2 :: [(Int,Int,Int,Int)]
generator2 = [(a,b,c,d)
    | a <- primes,
      b <- primes, b > a,
      c <- primes, c > b,
      d <- primes, d > c
    ]
    
    

-- ### 2.3 Selector2 ### --
selector2 :: (Int,Int,Int,Int) -> Bool
selector2 (v,x,y,z) = 
    let m = 3 + v + x 
        n = m + y + z
    in prime m && prime n 

-- ### Main ### --
main :: IO()
main = 
    print (head (filter selector2 generator2))