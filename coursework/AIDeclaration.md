## AI Declaration
> This coursework was categorised as AI assisted, provided that it was used on individual function and not whole programs. It is required that I must include prompts.
It was suggested to include hyperlinks to their output, however I do not have a ChatGPT account so I don't think I can. I've done my best by instead providing the responses that the AI gave me.

### 1. Multiple.hs
No A.I. generations used

### 2. PrimeTile.hs
A.I. used

---

Q : "Is there something in haskell like the lambda function in pytho?" 
A : "Yes! Haskell has anonymous functions, which are essentially the same concept as Python’s lambda. In Haskell, you define them using the \ (backslash) syntax.Here’s the basic syntax: \x -> x + 1"

---

Q : "Is there a function in haskell that I can use to remove repeat occurences of an element from a list?"
A : "Yes! In Haskell, you can remove repeated occurrences of elements from a list using functions from the Data.List module, or by using sets from Data.Set for efficiency.

1. Using nub from Data.List

The simplest way is with nub, which removes duplicates while preserving the original order:
import Data.List (nub)

uniqueList :: Eq a => [a] -> [a]
uniqueList xs = nub xs

-- Example
-- uniqueList [1,2,2,3,1,4]  => [1,2,3,4]"


### 3. DieHard.hs
No A.I. generaions used

### 4. SquareofallDigits.hs
A.I. used

---

Q: "what is a function that can check whether some list is just a rearrangement of some other list (haskell)"
A: "Ah! You want to check whether two lists are permutations of each other — i.e., whether one is just a rearrangement of the other. In Haskell, there are several ways to do this.

1. Using Data.List.sort

The simplest method is to sort both lists and check if they are equal:
import Data.List (sort)

isPermutation :: Ord a => [a] -> [a] -> Bool
isPermutation xs ys = sort xs == sort ys

-- Example
-- isPermutation [1,2,3] [3,1,2]  => True
-- isPermutation [1,2,2] [2,1,1]  => False"

---

Q: "So I know subsequences in haskell is function to make the powerset of a list, can  you make me a function which makes the powerset of a list but only for subsets up to a certain length?"
The result of this question was a back and forth which ended up with the boundedSubsequences function

---

Q: "is there a function in haskell which could a list of pairs from 2 lists, where the first one is a list of digits, and the second one is a list of those digits which have had an operation done on them"
A: "Yes! In Haskell, you can create a function that pairs elements from two lists, effectively creating a list of pairs (tuples). The built-in function zip does exactly that.

For example, if you have:
digits :: [Int]
digits = [1,2,3,4]

processed :: [Int]
processed = [2,4,6,8]  -- e.g., each digit multiplied by 2

You can pair them like this:
pairs :: [(Int, Int)]
pairs = zip digits processed
-- Result: [(1,2),(2,4),(3,6),(4,8)]
