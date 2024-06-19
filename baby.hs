-- Fooling around with Haskell



-- My comments are nuggets of wisdom



doubleMe :: Int -> Int
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x*2

-- Haskell every expression and function must return something.
-- If you don't explicitly return something, Haskell will return the last expression in the function by default.

conanO'Brien = "It's a-me, Conan O'Brien!" -- This is a definition (a function without parameters)

-- strings are lists

main :: IO ()
main = do
    putStrLn "Hello, World!"


assert :: Bool -> a -> a
assert False x = error "assertion failed!"
assert _     x = x


boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x] 

-- length' xs = sum [1 | _ <- xs] -- _ is a wildcard that matches anything and we don't care what it is

-- Just a friendly reminder: because strings are lists, we can use list comprehensions to process and produce strings. Here's a function that takes a string and removes everything except uppercase letters from it.

onlyUpper s = [x | x <- s, x `elem` ['A'..'Z']]


-- Define a recursive function to process the list
processTuples :: [(Int, Int, Int)] -> [Int]
processTuples [] = []
processTuples ((x, y, z):rest) = (x + y + z) : processTuples rest

-- Define your list of 3-tuples
tuplesList :: [(Int, Int, Int)]
tuplesList = [(1, 2, 3), (4, 5, 6), (7, 8, 9)]

-- Apply the function
result :: [Int]
result = processTuples tuplesList


addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r


-- basic pattern matching
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!" 

-- Pattern matching
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x


tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y


length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum'(xs)

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- bmiTell :: (RealFloat a) => a -> String
-- bmiTell bmi
--     | bmi <= 18.5 = "You're underweight, you emo, you!"
--     | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
--     | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
--     | otherwise   = "You're a whale, congratulations!"

-- -- can't overload it seems
-- bmiTell :: (RealFloat a) => a -> a -> String
-- bmiTell weight height
--     | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
--     | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
--     | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
--     | otherwise                 = "You're a whale, congratulations!"

max' :: (Ord a) => a -> a -> a
max' a b 
    | a > b     = a
    | otherwise = b

-- max' :: (Ord a) => a -> a -> a
-- max' a b | a > b = a | otherwise = b


myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
-- myCompare a b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
