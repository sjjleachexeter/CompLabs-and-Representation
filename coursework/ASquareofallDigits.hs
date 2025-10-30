prime :: Int -> Bool
prime n
  = factors n == [1,n]
    where
    factors n
      = [f | f <- [1..n], n `mod` f == 0]

coprime :: Int -> Int -> Bool
coprime a b = 
    prime a && prime

squareList :: [Int] -> [Int]
squareList (x:xs) =
    x = x^2 
    squareList xs

generator4 :: [Int]
generator4 = [a = [1..100]
            |
]