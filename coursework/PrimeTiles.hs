prime :: Int -> Bool
prime n
  = factors n == [1,n]
    where
    factors n
      = [f | f <- [1..n], n `mod` f == 0]


primes :: [Int]
primes = [3,5,7,11,13,17,19,23,29,31,37,41]

generator2 :: [[Int]]
generator2 = [[a,b,c,d]
    | a <- primes,
      b <- primes, b > a,
      c <- primes, c > b,
      d <- primes, d > c
    ]

selector2 :: (Int,Int,Int,Int) -> Bool
selector2 (v,x,y,z) = 
    let m = 3 + v + x 
        n = m + y + z
    in prime m && prime n 