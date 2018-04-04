module TenMinuteWalk where

import Control.Monad.State

isValidWalk :: [Char] -> Bool
isValidWalk walk = runState makeStep 'n'

calculateTargetLocation :: (Num a, Show a) => (a, a) -> Char -> (a, a)
calculateTargetLocation (x, y) 'n' = (x, y + 1)
calculateTargetLocation (x, y) 's' = (x, y - 1)
calculateTargetLocation (x, y) 'w' = (x + 1, y)
calculateTargetLocation (x, y) 'e' = (x - 1, y)

makeStep :: (Num a) => (State (Int, (a, a)) (a, a))
makeStep = State $ \(steps, (x, y)) -> (steps + 1, calculateTargetLocation (x, y))
