import System.IO
import System.Environment
import Data.List
import Data.List.Split


hasSeparator :: String -> Bool
hasSeparator = foldr (\x acc -> acc && x `elem` [':','|','-',' ']) True

-- generate a separator line |:---|:---| well sized
separator :: String -> [Int] -> String
separator s []     = s ++ "|"
separator s (x:xs) = separator
                      (s ++ "|:" ++ (take (x+1) (repeat '-'))) xs

addSeparatorLine :: [String] -> [Int] -> [String]
addSeparatorLine (h:e:t) n = if hasSeparator e then addSeparatorLine (h:t) n
                          else h : (separator "" n) : e : t

maxLenCol :: Int -> [[String]] -> Int
maxLenCol i l = maximum [length (x !! i) | x <- l]

lenCols :: [[String]] -> [Int]
lenCols l = let n = (length $ head l) - 1 in
            [maxLenCol i l | i <- [0..n]]

cleanExtraSpaces :: String -> String
cleanExtraSpaces "" = ""
cleanExtraSpaces (x:xs) = if last x' == ' ' then init x' else x'
  where x' = if x == ' ' then xs else (x:xs)

cells :: String -> [[String]]
cells s = let l  = map (splitOn "|") $ lines s
              l' = map (filter (/="")) l in
          (map . map) (cleanExtraSpaces) l'

addLeftPipe :: [[String]] -> [[String]]
addLeftPipe l = (map . map) ("| "++) l

addSpaces :: [[String]] -> [Int] -> [[String]]
addSpaces [] _ = []
addSpaces (x:xs) n = (zipWith (addSpacesStr) x n) : addSpaces xs n
  where addSpacesStr s n = let sn = (n+1) - (length s) in
                           s ++ (take sn (repeat ' '))

joinCells :: [[String]] -> [String]
joinCells s = map (foldr (++) "") s

format :: String -> String
format s = let cls = (map . map) (cleanExtraSpaces) $ cells s  in
           let lns = lenCols cls                               in
           let tbl = map (\x -> x ++ "|")
                     $ joinCells
                     $ addLeftPipe
                     $ addSpaces cls lns in
           intercalate "\n" $ addSeparatorLine tbl lns


-------------------------------------------------------------------------------
-- MAIN:
-------------------------------------------------------------------------------
main :: IO ()
main = do
  f <- getArgs
  putStrLn $ format $ f !! 0


-- NOTE: prefer using take and repeat function to generate the right amount of
-- spaces
