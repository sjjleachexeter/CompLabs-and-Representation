--### Question 1.1 Number ###--
number :: [Int] -> Int -- using Int not Integer as explained in lectures
number xs
  = totalize (reverse xs)
    where
    totalize []
      = 0
    totalize (x:xs)
      = x + 10 * totalize xs

--### Question 1.2 Generator ###--
generator1 :: [(Int,Int,Int,Int,Int,Int)]
generator1 =
    [(A,B,C,D,E,F)
    -- not the most beautiful method maybe, but it excludes the need to check if they
    -- are non-zero by only drawing from 1-9
    | A <- [1..9]
    , B <- [1..9], B /= A 
    , C <- [1..9], C /= B, C /= A 
    , D <- [1..9], D /= C, D /= B, D /= A 
    , E <- [1..9], E /= D, E /= C, E /= B, E /= A
    , F <- [1..9], F /= E, F /= D, F /= C, F /= B, F /= A
    ]
    
    
--### is perfect Sqr is a function to help the selector in 1.3 ###--
isperfSqr :: Int -> Bool
isperfSqr n = 
    sqrt n == sqrt (floor n)


--### Question 1.3 Selector ###--
selector1 :: (Int,Int,Int,Int,Int,Int) -> Bool
selector1 [(A,B,C,D,E,F)] =
    A + B + C + D + E + F == 5 * (A + F)
    && D > E && E > F 
    && isperfSqr (number [A,B,C,D,E,F]) 