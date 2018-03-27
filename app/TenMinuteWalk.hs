module TenMinuteWalk where

isValidWalk :: [Char] -> Bool
isValidWalk walk = error "todo: isValidWalk"

calculateTargetLocation :: (Num a, Show a) => (a, a) -> Char -> (a, a)
calculateTargetLocation (x, y) 'n' = (x, y + 1)
calculateTargetLocation (x, y) 's' = (x, y - 1)
calculateTargetLocation (x, y) 'w' = (x + 1, y)
calculateTargetLocation (x, y) 'e' = (x - 1, y)

