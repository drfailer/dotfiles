module Local.Prompt.CustomPrompts where

import System.IO
import XMonad
import XMonad.Util.Run

import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Input

import Data.List
import Data.List.Split
import Data.Maybe
import Data.String

import Local.Prompt.PromptConfig

--------------------------------------------------------------------------------
-- SEARCH PROMPT:
--------------------------------------------------------------------------------
myBookMarks :: [BookMark]
myBookMarks =
  [ BookMark "youtube" "https://youtube.com"
  , BookMark "ent" "https://ent.uca.fr"
  , BookMark "color" "https://htmlcolorcodes.com/fr/"
  , BookMark "mailFailer" "https://mail.google.com/mail/u/0/?ogbl#inbox"
  , BookMark "mailPro" "https://mail.google.com/mail/u/1/?ogbl#inbox"
  , BookMark "drive:Failer" "https://drive.google.com/drive/u/0/my-drive"
  , BookMark "drive:Pro" "https://drive.google.com/drive/u/1/my-drive"
  , BookMark "localhost" "localhost"
  , BookMark "github" "https://github.com"
  , BookMark
      "latex-Symbols"
      "https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols"
  , BookMark "wordReference" "https://www.wordreference.com/fr/"
  , BookMark "cheat-sheet" "https://devhints.io/"
  ]

myBrowser :: String
myBrowser = "firefox "

mySearchEngine :: String
mySearchEngine = "https://www.google.com/search?q="

data BookMark =
  BookMark
    { label :: String
    , url :: String
    }

data Search =
  Search

instance XPrompt Search where
  showXPrompt Search = "Search: "

searchPrompt :: XPConfig -> X ()
searchPrompt c = mkXPrompt Search c myCompFun makeSearch

format :: String -> String
format = (intercalate "+") . words

makeSearch :: String -> X ()
makeSearch str =
  case find (\x -> label x == str) myBookMarks of
    Just b -> spawn $ myBrowser ++ (url b)
    Nothing ->
      if "q:" `isPrefixOf` str
        then spawn ("qutebrowser " ++ mySearchEngine ++ (format $ drop 2 str))
        else spawn ("firefox " ++ mySearchEngine ++ (format str))

myCompFun :: ComplFunction
myCompFun = mkComplFunFromList $ map label myBookMarks
--------------------------------------------------------------------------------
-- HOOGLE PROMPT:
--------------------------------------------------------------------------------
-- TODO
