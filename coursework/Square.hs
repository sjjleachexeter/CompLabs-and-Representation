-- AI ASSISTED : I found subsequences myself on the wiki for Data.List, but sort was suggested to me for a function
-- to check the 0-9 condition
import Data.List (subsequences,sort)

-- ### 4.1 Co-Prime function ### --
coPrime :: Int -> Int -> Bool
coPrime a b = gcd a b == 1

-- ### helper function to split ints into digits ### --
digits :: Int -> [Int]
digits n
  | n < 10     =  [n]
  | otherwise  =  digits d ++ [m]
    where
    (d, m) = n `divMod` 10
    
-- ### helper function to check whether a list is an assortment of 0 - 9 ### --
isRearranged :: [Int] -> Bool
isRearranged xs = sort xs == [0..9]

-- ### helper function to find size limited subsets of the powerset### --
-- AI ASSISTED : boundedSubsequences was generarated by AI to pick only subsets of a powerset of a certain length
boundedSubsequences :: Int -> [a] -> [[a]]
boundedSubsequences maxLen xs = concatMap (\k -> choose k xs) [1..maxLen]
  where
    choose 0 _ = [[]]
    choose _ [] = []
    choose k (y:ys) = map (y:) (choose (k-1) ys) ++ choose k ys


-- ### 4.2 Generator4 function ### --
-- this function gave me a lot of grief. 
-- 1. it outputted around a google of numbers, more than are atoms in the universe according to the internet
-- 2. I tried doing it backwards, starting with [0..9] but finding the permutations and all the partitions of the permutations
-- was basically as difficult
-- The solve was making a subsequences function that capped out at 10, removing a lot of the computation stress
generator4 :: [[Int]] 
generator4 = [nums |
                let b = [2..99]
                -- AI ASSISTED : the zip funcion was suggested when asked how to get each corresponding pair into the same list
                , let pairs = zip b (map (digits . (^2)) b)  -- pairs the corresponding digits with numbers to easily track it
                , a <- boundedSubsequences 10 pairs
                , isRearranged (concatMap snd a)  
                , let nums = map fst a] 
                
-- ### helper function for selector4 to check through each list that they are all Coprime ### --
checkListCoprime :: [Int] -> Bool
checkListCoprime []     = True
checkListCoprime (x:xs) = all (coPrime x) xs && checkListCoprime xs

-- ### 4.3 selector4 function ### --
-- NEED CORRECT VARIABLES (NOT [[Int]] -> Bool)
selector4 :: [Int] -> Bool
selector4 = checkListCoprime

-- ### main function ### --
main :: IO()
main = print (head (filter selector4 generator4))