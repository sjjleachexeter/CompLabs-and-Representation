holds :: [Expr] -> Bool
holds (x:xs) = 
    | [] = True
    | x && holds xs
    
generator3 :: [(Int,[Int],[Int],[Int],Int)]
generator3 = [(a,[b1,b2,b3],[c1,c2,c3],[d1,d2,d3],e)
            | a <- [1..6],
            [(b1,b2,b3) | b1 <- [1..6], b1 /= a, b2 <- [1..6], b3 <- [1.6]],
            [(c1,c2,c3) | c1 <- [1..6], c1 /= b1, c1 /= a, c2 <- [1..6], c2 /= b2, c3 <- [1..6], c3 /= b3],
            [(d1,d2,d3) | d1 <- [1..6], d2 <- [1..6], d2 /= b2, d2 /= c2 d3 <- [1..6], d3 /= c3, d3 /= b3],
            e <- [1..6], e /= b3, e /= c3, e /= d3
            ]

number :: [Int] -> Int
number xs
  = totalize (reverse xs)
    where
    totalize []
      = 0
    totalize (x:xs)
      = x + 10 * totalize xs


prime :: Int -> Bool
prime n
  = factors n == [1,n]
    where
    factors n
      = [f | f <- [1..n], n `mod` f == 0]


selector3 :: (Int,[Int],[Int],[Int],Int) -> Bool
selector3 (a,[b1,b2,b3],[c1,c2,c3],[d1,d2,d3],e) =
    let m > n
        m > p
        a + b1 + b2 + b3 + c1 + c2 + c3 + d1 + d2 + d3 + e = f
    in p = prime (number [b1,b2,b3]) && n = prime (number [c1,c2,c3]) && m = prime (number [d1,d2,d3])
    && prime f
    