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
  , BookMark
      "programme tnt"
      "https://www.programme-tv.net/programme/programme-tnt.html"
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
-- SOUND PROMPT:
--------------------------------------------------------------------------------
amixerUnmute :: String
amixerUnmute = "amixer -c 0 sset PCM unmute"

data Sound =
  Sound

instance XPrompt Sound where
  showXPrompt Sound = "Sound: "

sounds :: [String]
sounds = ["100%", "75%", "50%", "25%", "mute", "unmute"]

soundCmd :: String -> String
soundCmd s
  | s == "mute" = "amixer -c 0 sset PCM mute"
  | s == "unmute" = amixerUnmute
  | otherwise =
    if last s == '%'
      then ("amixer -c 0 sset PCM " ++ s ++ "; " ++ amixerUnmute)
      else ("amixer -c 0 sset PCM " ++ s ++ "%; " ++ amixerUnmute)

updateSound :: String -> X ()
updateSound = spawn . soundCmd

soundComp :: ComplFunction
soundComp = mkComplFunFromList sounds

soundPrompt :: XPConfig -> X ()
soundPrompt c = mkXPrompt Sound c soundComp updateSound

--------------------------------------------------------------------------------
-- CONFIG PROMPT:
--------------------------------------------------------------------------------
data ConfigEditor =
  ConfigEditor

instance XPrompt ConfigEditor where
  showXPrompt ConfigEditor = "Edit: "

data ConfigFile =
  ConfigFile
    { name :: String
    , path :: String
    }

myConfigs :: [ConfigFile]
myConfigs =
  [ ConfigFile "xmonad" "~/.xmonad/xmonad.hs"
  , ConfigFile "xmobargruvbox" "~/.config/xmobar/xmobargruvbox"
  , ConfigFile "xmobar" "~/.config/xmobar/xmobarrc"
  , ConfigFile "xmobardark" "~/.config/xmobar/xmobardark"
  , ConfigFile "alacritty" "~/.config/alacritty/alacritty.yml"
  , ConfigFile "zshrc" "~/.config/zsh/.zshrc"
  , ConfigFile "vim:init" "~/.config/nvim/init.vim"
  , ConfigFile "vim:settings" "~/.config/nvim/general/settings.vim"
  , ConfigFile "vim:mapping" "~/.config/nvim/keys/mappings.vim"
  , ConfigFile "vim:which-key" "~/.config/nvim/keys/which-key.vim"
  , ConfigFile "vim:vim-plug" "~/.config/nvim/vim-plug/plugins.vim"
  , ConfigFile "vim:startify" "~/.config/nvim/plug-config/start-screen.vim"
  , ConfigFile "vim:coc-setting" "~/.config/nvim/coc-settings.json"
  , ConfigFile "picom" "~/.config/picom.conf"
  , ConfigFile "bookmark-firefox" "~/.scripts/dmenu/search/library.txt"
  , ConfigFile "qutebrowser" "~/.config/qutebrowser/config.py"
  ]

editConfig :: String -> X ()
editConfig cf =
  case find (\x -> name x == cf) myConfigs of
    Just p -> spawn $ "alacritty -e nvim " ++ (path p)
    Nothing -> return ()

configCompFun :: ComplFunction
configCompFun = mkComplFunFromList $ map (name) myConfigs

configPrompt :: XPConfig -> X ()
configPrompt c = mkXPrompt ConfigEditor c configCompFun editConfig

--------------------------------------------------------------------------------
-- BRIGHTNESS PROMPT (laptop):
--------------------------------------------------------------------------------
data BrightnessP =
  BrightnessP

instance XPrompt BrightnessP where
  showXPrompt BrightnessP = "Brightness: "

values :: [String]
values = ["1.0", "0.9", "0.8", "0.7", "0.6", "0.5"]

validateValue :: String -> String
validateValue v =
  if v /= "1.0" || ("0." `isPrefixOf` v)
    then v
    else "1.0"

ajustBrightness :: String -> X ()
ajustBrightness s =
  spawn $ "xrandr --output eDP1 --brightness " ++ (validateValue s)

brightnessCompFun :: ComplFunction
brightnessCompFun = mkComplFunFromList values

brightnessPrompt :: XPConfig -> X ()
brightnessPrompt c = mkXPrompt BrightnessP c brightnessCompFun ajustBrightness
