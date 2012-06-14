module Main where

main :: IO()
main = print $ sum $ merge multiplesOf3 multiplesOf5
  where
    multiplesOf3 = filter (\x -> (mod x 3) == 0) [1..999]
    multiplesOf5 = filter (\x -> (mod x 5) == 0) [1..999]

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
  | x == y = x : (merge xs ys)
  | x < y = x : (merge xs (y:ys))
  | otherwise = y : (merge (x:xs) ys)

