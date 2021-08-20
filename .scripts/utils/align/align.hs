import Data.Char
import Data.List
import Data.List.Split
import System.Environment
import System.IO

-------------------------------------------------------------------------------
-- HELP MESSAGE:
-------------------------------------------------------------------------------
-- TODO
help :: String
help =
  "Fromatting utility used to align text on separator\n\
  \Usage: align [SEPARATORS] [STRING]\n\
  \Examples:\n\
  \\n\
  \* basic example:\n\
  \\n\
  \align \"=\" \"      a = 2\n\
  \ hello = 3\"\n\
  \\n\
  \Output:\n\
  \\n\
  \a     = 2\n\
  \hello = 3\n\
  \\n\
  \* using multiple separators:\n\
  \\n\
  \align \"=,+\" \"  a = 2\n\
  \hello = 3+3\n\
  \patate = 2343+3\"\n\
  \\n\
  \Output:\n\
  \\n\
  \a      = 2\n\
  \hello  = 3    + 3\n\
  \patate = 2343 + 3\n\
  \\n\
  \To use multiple separator, you need to separate theme with a ','.\n\
  \"

-------------------------------------------------------------------------------
-- FUNCTIONS:
-------------------------------------------------------------------------------
-- TODO
elements :: String -> [String] -> [[String]]
elements sep s =
  let l = map (splitOn sep) s
      l' = map (filter (/= "")) l
   in cleanExtraSpaces l'

newLength :: [[String]] -> [Int]
newLength s = [maxLen l | l <- (transpose s)]
  where
    maxLen c = maximum [length x | x <- c]

addSpaces :: [Int] -> [[String]] -> [[String]]
addSpaces _ [] = []
addSpaces n (x:xs) = (zipWith (addSpacesStr) x n) : addSpaces n xs
  where
    addSpacesStr s n =
      let sn = n - (length s)
       in s ++ (take sn (repeat ' '))

cleanExtraSpacesStr :: String -> String
cleanExtraSpacesStr s
  | (head s) == ' ' = cleanExtraSpacesStr (tail s)
  | (last s) == ' ' = cleanExtraSpacesStr (init s)
  | otherwise = s

cleanExtraSpaces :: [[String]] -> [[String]]
cleanExtraSpaces = (map . map) cleanExtraSpacesStr

joinElts :: String -> [[String]] -> [String]
joinElts sep elts = map (intercalate (" " ++ sep ++ " ")) elts

-- use to save text indentation
textIndent :: [String] -> [String]
textIndent l = [indent s | s <- l]
  where
    indent = takeWhile isSpace

reIndent :: [String] -> [[String]] -> [[String]]
reIndent = zipWith (reIndentSub)
  where
    reIndentSub ind (x:xs) = (ind ++ x) : xs

align :: String -> String -> String
align sep s =
  let lns = lines s
      ind = textIndent lns
      elt = reIndent ind $ elements sep lns
      sps = newLength elt
   in (unlines . joinElts sep . addSpaces sps) elt

applySeps :: [String] -> String -> String
applySeps [] s = s
applySeps (sep:seps) s = applySeps seps $ align sep s

handleSep :: [String] -> String
handleSep args
  | ',' `elem` (args !! 0) = applySeps (splitOn "," (args !! 0)) (args !! 1)
  | otherwise = align (args !! 0) (args !! 1)

-------------------------------------------------------------------------------
-- MAIN:
-------------------------------------------------------------------------------
main :: IO ()
main = do
  args <- getArgs
  if null args
    then putStrLn
           "ERROR: invalid arguments, try to use --help flag for more informations"
    else case (head args) of
           "--help" -> putStrLn help
           otherwise ->
             if (length args) == 2
               then putStr $ handleSep args
               else putStrLn
                      "ERROR: invalid arguments, try to use --help flag for more informations"
