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
