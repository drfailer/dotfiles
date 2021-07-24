import System.IO
import System.Environment
import Data.List
import Data.List.Split


-------------------------------------------------------------------------------
-- HELP:
-------------------------------------------------------------------------------
help :: String
help = "Formating utility to create markdown table or align text on a separator.\n\
       \Usage: format-util [OPTION]... [STRING]\n\
       \Examples:\n\
       \\n\
       \* formating a markdown table:\n\
       \\n\
       \format-util -t \"|first|second|\n\
       \|first cell|second cell|\n\
       \|third cell!!|the last cell|\n\
       \\n\
       \* format code on equal sign:\n\
       \\n\
       \format-util -c \"=\" \"a = 1;\n\
       \hello = 2;\"\n\
       \\n\
       \-t        format a markdown table\n\
       \-s SEP    align text on SEP\n\
       \\n\
       \NOTE: the separator line on markdown tables is added automatically.\n\
       \"


-------------------------------------------------------------------------------
-- FORMATER TYPE:
-------------------------------------------------------------------------------
type Formater = String -> String -> String


-------------------------------------------------------------------------------
-- FUNCIONS:
-------------------------------------------------------------------------------
lenCols :: [[String]] -> [Int]
lenCols s = [ maxLen l | l <- (transpose s) ]
  where maxLen c = maximum [ length x | x <- c ]

cleanExtraSpacesStr :: String -> String
cleanExtraSpacesStr s
  | (head s) == ' ' = cleanExtraSpacesStr (tail s)
  | (last s) == ' ' = cleanExtraSpacesStr (init s)
  | otherwise       = s

cleanExtraSpaces :: [[String]] -> [[String]]
cleanExtraSpaces = (map . map) cleanExtraSpacesStr

cells :: String -> [String] -> [[String]]
cells sep s = let l  = map (splitOn sep) s
                  l' = map (filter (/="")) l in
              cleanExtraSpaces l'

addSpaces :: [[String]] -> [Int] -> [[String]]
addSpaces [] _     = []
addSpaces (x:xs) n = (zipWith (addSpacesStr) x n) : addSpaces xs n
  where addSpacesStr s n = let sn = n - (length s) in
                           s ++ (take sn (repeat ' '))

joinCells :: [[String]] -> [String]
joinCells s = map (intercalate " ") s


-- MARKDOWN TABLES FUNCTIONS:

isSeparatorLn :: String -> Bool
isSeparatorLn = foldr (\x acc -> acc && x `elem` [':','|','-',' ']) True

-- generate a separator line |:---|:---| well sized
separatorLn :: String -> [Int] -> String
separatorLn s []     = s ++ "|"
separatorLn s (x:xs) = separatorLn (s ++ "|:" ++ (take (x+1) (repeat '-'))) xs

addSeparatorLn :: [String] -> [Int] -> [String]
addSeparatorLn (x:xs) n = x : (separatorLn "" n) : xs

removeSeparatorLn :: [String] -> [String]
removeSeparatorLn (x:y:xs) = if isSeparatorLn y then (x:xs)
                             else (x:y:xs)

addLeftPipe :: [[String]] -> [[String]]
addLeftPipe l = (map . map) ("| "++) l

-- SEPARATOR FUNCTIONS:

applySeps :: [String] -> String -> String
applySeps []     s = s
applySeps (x:xs) s = applySeps xs $ formatSep x s

handleSep :: [String] -> String
handleSep args
  | ',' `elem` (args !! 1) = applySeps (splitOn "," $ args !! 1) (args !! 2)
  | otherwise              = formatSep (args !! 1) (args !! 2)

-------------------------------------------------------------------------------
-- MARKDOWN TABLES FORMATER:
-------------------------------------------------------------------------------
formatTable :: Formater
formatTable sep s = let cls = cells sep $ removeSeparatorLn $ lines s
                        lns = lenCols cls
                        tbl = map (\x -> x ++ " " ++ sep)
                          $ joinCells
                          $ addLeftPipe
                          $ addSpaces cls lns in
                    intercalate "\n" $ addSeparatorLn tbl lns


-------------------------------------------------------------------------------
-- CUSTOM SEPARATOR FORMATER:
-------------------------------------------------------------------------------
formatSep :: Formater
formatSep sep s = let cls = cells sep $ lines s
                      lns = lenCols cls
                      tbl = map (intercalate $ ' ' : sep ++ " ")
                        $ addSpaces cls lns in
                  intercalate "\n" tbl


-------------------------------------------------------------------------------
-- MAIN:
-------------------------------------------------------------------------------
main :: IO ()
main = do
  args <- getArgs
  case (head args) of
    "-t"      -> putStrLn $ formatTable "|" (args !! 1)
    "-s"      -> putStrLn $ handleSep args
    "--help"  -> putStrLn help
    otherwise -> putStrLn "Unknown parameter, try to use \"--help\" to get more informations."
