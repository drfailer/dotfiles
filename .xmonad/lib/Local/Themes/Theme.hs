module Local.Themes.Theme where

import XMonad

import XMonad.Hooks.DynamicLog (xmobarColor)


data Theme = Theme { colorCurrent :: String -> String
                   , colorHiddenNoWindows :: String -> String
                   , colorHidden :: String -> String
                   , colorTitle :: String -> String
                   , colorVisible :: String -> String
                   , xmobarConf :: String
                   , colorSep :: String
                   , promptFG :: String
                   , promptBG :: String
                   , promptSelection :: String
                   , promptBorder :: String
                   }


theme0 :: Theme
theme0 = Theme { colorCurrent         = xmobarColor "#1e2127,#E5C07B" ""
               , colorHiddenNoWindows = xmobarColor "#bd93f9" ""
               , colorHidden          = xmobarColor "#82AAFF" ""
               , colorTitle           = xmobarColor "#a9a1e1" ""
               , colorVisible         = xmobarColor "#E5C07B" ""
               , xmobarConf           = "xmobarrc"
               , colorSep             = "  " -- "<fc=#666666> \xe0b1 </fc>"
               , promptFG             = "#ABB2BF"
               , promptBG             = "#1e2127"
               , promptSelection      = "#C678DD"
               , promptBorder         = "#000000"
               }

theme1 :: Theme
theme1 = Theme { colorCurrent         = xmobarColor "#000000,#dc9656" ""
               , colorHiddenNoWindows = xmobarColor "#af87af" ""
               , colorHidden          = xmobarColor "#5f87af" ""
               , colorTitle           = xmobarColor "#d77575" ""
               , colorVisible         = xmobarColor "#dc9656" ""
               , xmobarConf           = "xmobardark"
               , colorSep             = "  "
               , promptFG             = "#ABB2BF"
               , promptBG             = "#000000"
               , promptSelection      = "#dc9656"
               , promptBorder         = "#333333"
               }


theme2 :: Theme
theme2 = Theme { colorCurrent         = xmobarColor "#000000,#a06666" ""
               , colorHiddenNoWindows = xmobarColor "#999999" ""
               , colorHidden          = xmobarColor "#5f8787" ""
               , colorTitle           = xmobarColor "#dd9999" ""
               , colorVisible         = xmobarColor "#a06666" ""
               , xmobarConf           = "xmobarmetal"
               , colorSep             = "  "
               , promptFG             = "#ABB2BF"
               , promptBG             = "#000000"
               , promptSelection      = "#a06666"
               , promptBorder         = "#333333"
               }


--------------------------------------------------------------------------------
-- BORDER SETTINGS:
--------------------------------------------------------------------------------

myBorderWidth :: Dimension
myBorderWidth = 2

myNormalBorderColor :: String
myNormalBorderColor  = "#000000"

myFocusedBorderColor :: String
myFocusedBorderColor = "#5f87af"

currentTheme :: Theme
currentTheme = theme0
