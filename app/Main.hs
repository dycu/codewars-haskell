module Main where

import Lib
import TenMinuteWalk

main :: IO ()
main = print $ calculateTargetLocation (0, 0) 'n'
--main = print "test"
