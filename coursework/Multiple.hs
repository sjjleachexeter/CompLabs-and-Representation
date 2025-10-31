-- ### Question 1.1 Number ### --
number :: [Int] -> Int -- using Int not Integer as explained in lectures
number xs
  = totalize (reverse xs)
    where
    totalize []
      = 0
    totalize (x:xs)
      = x + 10 * totalize xs

-- ### Question 1.2 Generator ### --
generator1 :: [(Int,Int,Int,Int,Int,Int)]
generator1 =
    [(a,b,c,d,e,f)
    -- not the most beautiful method maybe, but it excludes the need to check if they
    -- are non-zero by only drawing from 1-9
    | a <- [1..9]
    , b <- [1..9], b /= a 
    , c <- [1..9], c /= b, c /= a 
    , d <- [1..9], d /= c, d /= b, d /= a 
    , e <- [1..9], e /= d, e /= c, e /= b, e /= a
    , f <- [1..9], f /= e, f /= d, f /= c, f /= b, f /= a
    ]
    
    
-- ### is perfect Sqr is a function to help the selector in 1.3 ### --
isperfSqr :: Int -> Bool
isperfSqr n = 
    p * q == n
    where
     p = floor (sqrt (fromIntegral n))
     q = floor (sqrt (fromIntegral n))


-- ### Question 1.3 Selector ### --
selector1 :: (Int,Int,Int,Int,Int,Int) -> Bool
selector1 (a,b,c,d,e,f) =
    a + b + c + d + e + f == 5 * (a + f)
    && d > e && e > f 
    && isperfSqr (number [a,b,c,d,e,f]) 
    
-- ### Main ### ---
main :: IO()
main = print (head (filter selector1 generator1))