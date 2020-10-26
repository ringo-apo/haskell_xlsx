{-# LANGUAGE OverloadedStrings #-}

module Main where

import Codec.Xlsx
import qualified Data.ByteString.Lazy as L
import Control.Lens

main :: IO ()
main = do
  bs <- L.readFile "report.xlsx"
  let value = toXlsx bs ^? ixSheet "List1" .
              ixCell (3,2) . cellValue . _Just
  putStrLn $ "Cell B3 contains " ++ show value
