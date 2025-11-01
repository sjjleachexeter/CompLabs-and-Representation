-- ### 3.1 Holds function ### --
holds :: [Bool] -> Bool
-- conditions for True --
holds [] = True
holds (x:xs) = x && holds xs


-- ### 3.2 generator3 function ### --
generator3 :: [(Int,[Int],[Int],[Int],Int)]
-- this generator needs to take a number of things into account:
-- 1. Physical adjacency (not only are they not repeated, a regular 6 sided die has the sides in order)
-- 2. Opposites adding to 7
generator3 = [(a,[b1,b2,b3],[c1,c2,c3],[d1,d2,d3],e)
            |
                -- First die
                a <- [1..6], b1 <- [1..6], c1 <- [1..6], d1 <- [1..6],
                a /= b1, a /= c1, a /= d1, b1 /= c1, b1 /= d1, c1 /= d1, 7-d1 /= a,
                (not (holds [b1==4,c1==3,d1==6])) || a == 2,
                (not (holds [b1==3,c1==4,d1==6])) || a == 5,
                -- Second die
                b2 <- [1..6], c2 <- [1..6], d2 <- [1..6],
                b2 /= c2, b2 /= d2, c2 /= d2,
                -- Third die
                b3 <- [1..6], c3 <- [1..6], d3 <- [1..6], e <- [1..6],
                b3 /= c3, b3 /= d3, b3 /= e, c3 /= d3, c3 /= e, d3 /= e, 7-d3 /= e,
                (not (holds [b3==4,c3==3,d3==6])) || e == 5,
                (not (holds [b3==3,c3==4,d3==6])) || e == 2]
                

-- ### A function to dermine oppositness ### --
opposite :: Int -> Int -> Bool
opposite a b = a + b == 7


-- ### additional function to help with adding the sides together ### --
number :: [Int] -> Int
number xs
  = totalize (reverse xs)
    where
    totalize []
      = 0
    totalize (x:xs)
      = x + 10 * totalize xs

-- ### Prime checker function ###--
prime :: Int -> Bool
prime n
  = factors n == [1,n]
    where
    factors n
      = [f | f <- [1..n], n `mod` f == 0]

-- ### 3.3 selector3 function ### --
selector3 :: (Int,[Int],[Int],[Int],Int) -> Bool
-- [bs are the front] [cs are the back] [ds are the top] --
selector3 (a,[b1,b2,b3],[c1,c2,c3],[d1,d2,d3],e) =
    let d = number [d1,d2,d3] 
        c = number [c3,c2,c1] 
        b = number [b1,b2,b3]
        f = a + b1 + b2 + b3 + c1 + c2 + c3 + d1 + d2 + d3 + e
    in holds [b<d,c<d,b<c,prime d,prime c, prime b,prime f,opposite b1 c1, opposite b2 c2, opposite b3 c3]

-- ### Main function ### --
main :: IO()
main = 
    print (head (filter selector3 generator3))