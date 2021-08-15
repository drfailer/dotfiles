import Data.List
import Data.List.Split
import System.Environment
import System.IO

-------------------------------------------------------------------------------
-- HELP:
-------------------------------------------------------------------------------
help :: String
help =
  "Formating utility to create markdown table.\n\
       \Usage: format-table [STRING]\n\
       \Examples:\n\
       \\n\
       \format-table \"|first|second|\n\
       \|first cell|second cell|\n\
       \|third cell!!|the last cell|\n\
       \\n\
       \NOTE: the separator line on markdown tables is added automatically.\n\
       \"

-------------------------------------------------------------------------------
-- FUNCIONS:
-------------------------------------------------------------------------------
lenCols :: [[String]] -> [Int]
lenCols s = [maxLen l | l <- (transpose s)]
  where
    maxLen c = maximum [length x | x <- c]

cleanExtraSpacesStr :: String -> String
cleanExtraSpacesStr s
  | (head s) == ' ' = cleanExtraSpacesStr (tail s)
  | (last s) == ' ' = cleanExtraSpacesStr (init s)
  | otherwise = s

cleanExtraSpaces :: [[String]] -> [[String]]
cleanExtraSpaces = (map . map) cleanExtraSpacesStr

cells :: [String] -> [[String]]
cells s =
  let l = map (splitOn "|") s
      l' = map (filter (/= "")) l
   in cleanExtraSpaces l'

addSpaces :: [[String]] -> [Int] -> [[String]]
addSpaces [] _ = []
addSpaces (x:xs) n = (zipWith (addSpacesStr) x n) : addSpaces xs n
  where
    addSpacesStr s n =
      let sn = n - (length s)
       in s ++ (take sn (repeat ' '))

joinCells :: [[String]] -> [String]
joinCells s = map (intercalate " ") s

isSeparatorLn :: String -> Bool
isSeparatorLn = foldr (\x acc -> acc && x `elem` [':', '|', '-', ' ']) True

-- generate a separator line |:---|:---| well sized
separatorLn :: String -> [Int] -> String
separatorLn s [] = s ++ "|"
separatorLn s (x:xs) = separatorLn (s ++ "|:" ++ (take (x + 1) (repeat '-'))) xs

addSeparatorLn :: [String] -> [Int] -> [String]
addSeparatorLn (x:xs) n = x : (separatorLn "" n) : xs

removeSeparatorLn :: [String] -> [String]
removeSeparatorLn (x:y:xs) =
  if isSeparatorLn y
    then (x : xs)
    else (x : y : xs)

addLeftPipe :: [[String]] -> [[String]]
addLeftPipe l = (map . map) ("| " ++) l

-------------------------------------------------------------------------------
-- MARKDOWN TABLES FORMATER:
-------------------------------------------------------------------------------
formatTable :: String -> String
formatTable s =
  let cls = cells $ removeSeparatorLn $ lines s
      lns = lenCols cls
      tbl = map (\x -> x ++ " |") $ joinCells $ addLeftPipe $ addSpaces cls lns
   in intercalate "\n" $ addSeparatorLn tbl lns

-------------------------------------------------------------------------------
-- MAIN:
-------------------------------------------------------------------------------
main :: IO ()
main = do
  args <- getArgs
  case (head args) of
    "--help" -> putStrLn help
    otherwise -> putStrLn $ formatTable (args !! 0)
