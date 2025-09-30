base5 :: Int -> [Int]
base5 n
    | n < 5 = [n]
    | otherwise = base5 (n `div` 5) ++[n `mod` 5]
    
    
base8 :: Int -> [Int]
base8 n
    | n < 8 = [n]
    | otherwise = base8 (n `div` 8) ++[n `mod` 8]
    
-- base16 :: Int -> [String]
-- base16 n
--     | n < 16 = conv n
--     | otherwise = base16 (n `div` 16) ++conv[n `mod` 8]
    
-- Conv :: Int -> Char
-- Conv n
--     | n == 10 = "A"
--     | n == 11 = "B"
--     | n == 12 = "C"
--     | n == 13 = "D"
--     | n == 14 = "E"
--     | n == 15 = "F"
--     | otherwise n = n

generator :: [Int]
generator
    = [512..624]
    
selector :: Int ->  [Int]
selector n
    = equalset (base5 n) (base8 n)
    
equalset :: [Int] -> [Int] -> Bool
equalset n m
    = subset n m && subset m n
    
subset :: [Int] -> [Int] -> Bool
subset (a:as) bs
    | a `elem` bs = subset as bs
    | otherwise = False
subset [] bs
    = True

main :: IO ()
main
    = print (base16 324)