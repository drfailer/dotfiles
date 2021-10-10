module Local.Themes.Theme where

import XMonad
import XMonad.Layout.Tabbed

import XMonad.Hooks.DynamicLog (xmobarColor)

data MyTheme =
  MyTheme
    { colorCurrent :: String -> String
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
    , mainBorderColor :: String
    , fBorderColor :: String
    , tabForeground :: String
    , tabBackGround :: String
    }

theme0 :: MyTheme
theme0 =
  MyTheme
    { colorCurrent = xmobarColor "#1e2127,#E5C07B" ""
    , colorHiddenNoWindows = xmobarColor "#bd93f9" ""
    , colorHidden = xmobarColor "#82AAFF" ""
    , colorTitle = xmobarColor "#a9a1e1" ""
    , colorVisible = xmobarColor "#E5C07B" ""
    , xmobarConf = "xmobarrc"
    , colorSep = "  " -- "<fc=#666666> \xe0b1 </fc>"
    , promptFG = "#ABB2BF"
    , promptBG = "#1e2127"
    , promptSelection = "#C678DD"
    , promptBorder = "#000000"
    , mainBorderColor = "#000000"
    , fBorderColor = "#5f87af"
    , tabForeground = "#1e2127"
    , tabBackGround = "#5f87af"
    }

theme1 :: MyTheme
theme1 =
  MyTheme
    { colorCurrent = xmobarColor "#000000,#dc9656" ""
    , colorHiddenNoWindows = xmobarColor "#af87af" ""
    , colorHidden = xmobarColor "#5f87af" ""
    , colorTitle = xmobarColor "#d77575" ""
    , colorVisible = xmobarColor "#dc9656" ""
    , xmobarConf = "xmobardark"
    , colorSep = "  "
    , promptFG = "#ABB2BF"
    , promptBG = "#000000"
    , promptSelection = "#af87af"
    , promptBorder = "#333333"
    , mainBorderColor = "#000000"
    , fBorderColor = "#5f87af"
    , tabForeground = "#000000"
    , tabBackGround = "#5f87af"
    }

theme2 :: MyTheme
theme2 =
  MyTheme
    { colorCurrent = xmobarColor "#000000,#a06666" ""
    , colorHiddenNoWindows = xmobarColor "#999999" ""
    , colorHidden = xmobarColor "#5f8787" ""
    , colorTitle = xmobarColor "#dd9999" ""
    , colorVisible = xmobarColor "#a06666" ""
    , xmobarConf = "xmobarmetal"
    , colorSep = "  "
    , promptFG = "#ABB2BF"
    , promptBG = "#000000"
    , promptSelection = "#a06666"
    , promptBorder = "#333333"
    , mainBorderColor = "#000000"
    , fBorderColor = "#5f87af"
    , tabForeground = "#000000"
    , tabBackGround = "#5f87af"
    }

theme3 :: MyTheme
theme3 =
  MyTheme
    { colorCurrent = xmobarColor "#282828,#458588:0" ""
    , colorHiddenNoWindows = xmobarColor "#bfbaba" ""
    , colorHidden = xmobarColor "#fabd2f" ""
    , colorTitle = xmobarColor "#689d6a" ""
               -- , colorVisible         = xmobarColor "#928374" ""
    , colorVisible = xmobarColor "#458588" ""
    , xmobarConf = "xmobargruvbox"
    , colorSep = "  "
    , promptFG = "#bfbaba"
    , promptBG = "#1d2021"
    , promptSelection = "#d65d0e"
     -- , promptBorder = "#928374"
    , promptBorder = "#282828"
    , mainBorderColor = "#282828"
    , fBorderColor = "#458588"
     -- , fBorderColor = "#928374"
    , tabForeground = "#458588"
    , tabBackGround = "#1d2021"
    }

--------------------------------------------------------------------------------
-- BORDER SETTINGS:
--------------------------------------------------------------------------------
myBorderWidth :: Dimension
myBorderWidth = 2

myNormalBorderColor :: String
myNormalBorderColor = mainBorderColor currentTheme

-- myNormalBorderColor  = "#000000"
myFocusedBorderColor :: String
myFocusedBorderColor = fBorderColor currentTheme

-- myFocusedBorderColor = "#5f87af"
--------------------------------------------------------------------------------
-- CURRENT THEME:
--------------------------------------------------------------------------------
currentTheme :: MyTheme
currentTheme = theme3

--------------------------------------------------------------------------------
-- TABS THEME:
--------------------------------------------------------------------------------
myTabTheme :: Theme
myTabTheme =
  def
    { fontName = "xft:Pro Font For Powerline:size10"
    , activeColor = tabForeground currentTheme
    , inactiveColor = tabBackGround currentTheme
    , urgentColor = tabBackGround currentTheme
    , activeBorderColor = tabForeground currentTheme
    , inactiveBorderColor = "#282828" -- TODO
    , urgentBorderColor = tabBackGround currentTheme
    , activeTextColor = tabBackGround currentTheme
    , inactiveTextColor = "#bfbaba" -- TODO
    }
