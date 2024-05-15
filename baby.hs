-- Fooling around with Haskell



-- My comments are nuggets of wisdom



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

length' xs = sum [1 | _ <- xs] -- _ is a wildcard that matches anything and we don't care what it is

-- Just a friendly reminder: because strings are lists, we can use list comprehensions to process and produce strings. Here's a function that takes a string and removes everything except uppercase letters from it.

onlyUpper s = [x | x <- s, x `elem` ['A'..'Z']]
