import Data.List (subsequences)
-- ### 4.1 Coprime ### --
coprime :: Int -> Int -> Bool
coprime a b = 
    gcd a b == 1

-- ### a helper fuction to go through a list and square a function ### --
squarerootList :: [Int] -> [Int]
squarerootList xs = map (sqrt) xs

-- ### a helper function for generator4 ### --
number :: [Int] -> Int
number xs
  = totalize (reverse xs)
    where
    totalize []
      = 0
    totalize (x:xs)
      = x + 10 * totalize xs

-- ### a helper to specify the wanted digits ### --
wantedlist :: [Int]
wantedlist = [0..9]

-- ### 4.2 generator4 ### --
generator4 :: [Int]
generator4 =
  [ a
  | let b = subsequences wantedlist
  , let c = map (number) b 
  , a <- c]

-- -- ### 4.3 selector4 ### --
-- selector4 :: 

-- ### main ### --
main :: IO()
main = 
    print (head (generator4))