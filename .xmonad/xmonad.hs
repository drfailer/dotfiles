--------------------------------------------------------------------------------
--          ██╗  ██╗███╗   ███╗ ██████╗ ███╗   ██╗ █████╗ ██████╗             --
--          ╚██╗██╔╝████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗            --
--           ╚███╔╝ ██╔████╔██║██║   ██║██╔██╗ ██║███████║██║  ██║            --
--           ██╔██╗ ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══██║██║  ██║            --
--          ██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██║██████╔╝            --
--          ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝             --
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- IMPORTS:
--------------------------------------------------------------------------------
import XMonad
import XMonad.Config.Desktop
import System.Exit
import System.IO
import System.Environment
import qualified XMonad.StackSet as W

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers

import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.XMonad
import XMonad.Prompt.Shell
import XMonad.Prompt.FuzzyMatch
-- import XMonad.Prompt.Unicode

import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)

import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile

import XMonad.Actions.FloatKeys

import Data.Monoid
import Data.Ratio
import Data.Char (toUpper, isSpace)
import Data.Kind
import Data.Maybe
import qualified Data.Map        as M


--------------------------------------------------------------------------------
-- BASIC SETTINGS:
--------------------------------------------------------------------------------
myTerminal      = "alacritty"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myBorderWidth   = 2
myModMask       = mod4Mask

_JAVA_AWT_WM_NONREPARENTING=1
--AWT_TOOLKIT=MToolkit

myNormalBorderColor  = "#282C34"
-- myFocusedBorderColor = "#a9a1e1"
myFocusedBorderColor = "#2257A0"


--------------------------------------------------------------------------------
-- SOME USEFUL VARIABLES:
--------------------------------------------------------------------------------
termLaunch :: String
termLaunch = myTerminal ++ " -e "

coursesPath :: String
coursesPath = " ~/Desktop/cours/cours_s4/"

calcurseCommand :: String
calcurseCommand = "calcurse -C ~/.config/calcurse -D ~/.local/share/calcurse"

-- xmobar colors:
-- [ppCurrent, ppHiddenNoWindows, ppHidden, ppTitle, ppVisible]
ppColorsOnedark :: [String]
ppColorsOnedark = ["#E5C07B", "#bd93f9", "#82AAFF", "#a9a1e1", "#E5C07B"]

ppColorsDark :: [String]
ppColorsDark = ["#B04C50", "#bfbaba", "#66899D", "#B04C50", "#B04C50"]

currentTheme :: [String]
currentTheme = ppColorsOnedark


--------------------------------------------------------------------------------
-- WORKSPACES:
--------------------------------------------------------------------------------
myWorkspaces :: [String]
myWorkspaces = [ "main","dev", "doc", "www", "buff", "chat", "msc", "vid", "sys"]
-- myWorkspaces = [ "\xf015","\xf121", "\xf07b", "\xf002", "\xf00b", "\xf1e0",
-- "\xf001", "\xf03d", "\xf1de"]


--------------------------------------------------------------------------------
-- WINDOWS COUNT FUNCTION:
--------------------------------------------------------------------------------
windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack .
    W.workspace . W.current . windowset


--------------------------------------------------------------------------------
-- XMONAD PROMPT:
--------------------------------------------------------------------------------
myXPConfig :: XPConfig
myXPConfig = def
    {font                 = "xft:Pro Font For Powerline:size10"
    , bgColor             = "#1e2127"
    , fgColor             = "#ABB2BF"
    , bgHLight            = "#1e2127"
    , fgHLight            = "#C678DD"
    , borderColor         = "#000000"
    , promptBorderWidth   = 1
    , promptKeymap        = emacsLikeXPKeymap
    , position            = Top
    , alwaysHighlight     = True
    , height              = 20
    , historySize         = 256
    , historyFilter       = id
    , defaultText         = []
    , autoComplete        = Just 100000
    , showCompletionOnTab = False
    , maxComplRows        = Just 3
    , searchPredicate     = fuzzyMatch
    }


--------------------------------------------------------------------------------
-- CUSTOM PROMPT:
--------------------------------------------------------------------------------
myCustomPrompt :: XPConfig -> String -> X ()
myCustomPrompt c ans =
    inputPrompt c (trim ans) ?+ \input ->
        liftIO(runProcessWithInput "qalc" [input] "") >>= myCustomPrompt c
    where
        trim = f . f
            where f = reverse . dropWhile isSpace


--------------------------------------------------------------------------------
-- BASIC KEYBINDINGS:
--------------------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm, xK_space ), sendMessage NextLayout)
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [  xK_ampersand
                                                  , xK_eacute
                                                  , xK_quotedbl
                                                  , xK_quoteright
                                                  , xK_parenleft
                                                  , xK_minus
                                                  , xK_egrave
                                                  , xK_underscore
                                                  , xK_ccedilla
                                                 ]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_z, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_z, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


--------------------------------------------------------------------------------
-- BETTER KEYBINDINGS:
--------------------------------------------------------------------------------
myAdditionalKeys :: [(String, X ())]
myAdditionalKeys =
    [ ("M-p", spawn "dmenu_run -p 'Run:'")
    , ("M-S-p x", xmonadPrompt myXPConfig)
    , ("M-S-p r", shellPrompt myXPConfig)
    , ("M-S-p m", myCustomPrompt myXPConfig "Calculate")

    , ("M-S-q", io (exitWith ExitSuccess))
    , ("M-q", spawn "xmonad --recompile; xmonad --restart")
    , ("M-s", refresh)
    , ("M-S-c", kill)
    , ("M-b", sendMessage ToggleStruts)

    -- Window navigation
    , ("M-<Tab>", windows W.focusDown)
    , ("M-j", windows W.focusDown)
    , ("M-k", windows W.focusUp)
    , ("M-m", windows W.focusMaster)
    , ("M-<Return>", windows W.swapMaster)
    , ("M-t", withFocused $ windows . W.sink)

    -- Moving windows
    , ("M-S-h", sendMessage (IncMasterN 1))
    , ("M-S-l", sendMessage (IncMasterN (-1)))
    , ("M-S-j", windows W.swapDown  )
    , ("M-S-k", windows W.swapUp    )

    -- resizing
    , ("M-M1-h", sendMessage Shrink)
    , ("M-M1-l", sendMessage Expand)
    , ("M-M1-j", sendMessage MirrorShrink)
    , ("M-M1-k", sendMessage MirrorExpand)

    -- Resize floating windows
    , ("M-C-p", withFocused (keysResizeWindow (50, 0) (0, 1)))
    , ("M-C-u", withFocused (keysResizeWindow (-50, -0) (0, 1)))
    , ("M-C-o", withFocused (keysResizeWindow (0, -50) (0, 0)))
    , ("M-C-i", withFocused (keysResizeWindow (0, 50) (0, 0)))

      -- Move floating windows:
    , ("M-C-h", withFocused (keysMoveWindow (-50, 0)))
    , ("M-C-j", withFocused (keysMoveWindow (0, 50)))
    , ("M-C-k", withFocused (keysMoveWindow (0, -50)))
    , ("M-C-l", withFocused (keysMoveWindow (50, 0)))

    -- app launch
    , ("M-d",     spawn $ termLaunch ++ "ranger")
    , ("M-S-d",   spawn $ termLaunch ++ "ranger" ++ coursesPath)
    , ("M-S-a c", spawn $ termLaunch ++ calcurseCommand)
    , ("M-S-a m", spawn $ termLaunch ++ "neomutt")
    , ("M-S-a y", spawn $ termLaunch ++ "~/.local/share/cargo/bin/ytop -p -s")
    , ("M-S-a f", spawn "firefox")

    -- dmenu scripts
    , ("M-f", spawn "exec ~/.scripts/dmenu/search/search")
    , ("M-n r", spawn "exec ~/.scripts/dmenu/notes/read-note")
    , ("M-n e", spawn "exec ~/.scripts/dmenu/notes/edit-notes")
    , ("M-S-p c", spawn "exec ~/.scripts/dmenu/editconf/editconf")

    -- Spacing: windows and borders
    , ("M-i", (incWindowSpacing 10))
    , ("M-u", (decWindowSpacing 10))
    , ("M-S-i", (incScreenSpacing 10))
    , ("M-S-u", (decScreenSpacing 10))]


--------------------------------------------------------------------------------
-- MOUSE BINDINGS:
--------------------------------------------------------------------------------
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]


--------------------------------------------------------------------------------
-- LAYOUTS:
--------------------------------------------------------------------------------
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

myLayout = avoidStruts (tiled ||| Mirror tiled ||| full ||| treeCols ||| grid)
  where
     -- Put space between windows
     tiled    =  mySpacing 6 $ ResizableTall nmaster delta ratio []
     treeCols =  mySpacing 6 $ ThreeColMid nmaster delta ratio
     grid     =  mySpacing 6 $ Grid
     full     =  noBorders Full
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


--------------------------------------------------------------------------------
-- Hooks:
--------------------------------------------------------------------------------
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     [ className =? "vlc"     --> doShift ( myWorkspaces !! 8 )
     , className =? "Gimp"    --> doFloat
     , title =? "sxiv"    --> doFloat
     , title =? "Processing Camera" --> doFloat
     , title =? "Discord" --> doShift ( myWorkspaces !! 5 )
     , title =? "Oracle VM VirtualBox Manager"     --> doFloat
     , className =? "VirtualBox Manager" --> doShift  ( myWorkspaces !! 4 )
     , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
     ]

myEventHook = mempty


--------------------------------------------------------------------------------
-- LOG:
--------------------------------------------------------------------------------
myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1.0


--------------------------------------------------------------------------------
-- STARTUP:
--------------------------------------------------------------------------------
myStartupHook = do
  spawnOnce "nitrogen --restore &"
  -- spawnOnce "compton --config ~/.config/compton.conf"
  spawnOnce "conky"
  spawnOnce "xrandr --output HDMI-1 --primary --left-of DVI-D-1 --output DVI-D-1 --auto"
  spawnOnce "setxkbmap -layout fr -option ctrl:nocaps"
  setWMName "LG3D"


--------------------------------------------------------------------------------
-- MAIN:
--------------------------------------------------------------------------------
main = do
    xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
    xmonad $ docks def
        { manageHook = manageDocks <+> myManageHook
                        <+> manageHook desktopConfig
        , layoutHook         = myLayout
        , handleEventHook    = myEventHook
        , startupHook        = myStartupHook
        , terminal           = myTerminal
        , focusFollowsMouse  = myFocusFollowsMouse
        , clickJustFocuses   = myClickJustFocuses
        , borderWidth        = myBorderWidth
        , modMask            = myModMask
        , workspaces         = myWorkspaces
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , keys               = myKeys
        , mouseBindings      = myMouseBindings
        , logHook = myLogHook <+> dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppCurrent = xmobarColor (currentTheme !! 0) "" . wrap "[" "]"
                        , ppHiddenNoWindows = xmobarColor (currentTheme !! 1) ""
                        , ppHidden = xmobarColor (currentTheme !! 2) "" . wrap "*" ""
                        , ppTitle   = xmobarColor (currentTheme !! 3) "" . shorten 30
                        , ppSep =  "<fc=#666666> \xe0b1 </fc>"
                        , ppVisible = xmobarColor (currentTheme !! 4) ""
                        , ppUrgent  = xmobarColor "red" "yellow"
                        , ppExtras  = [windowCount]
                        }
        } `additionalKeysP` myAdditionalKeys
        `removeKeysP` ["M-S-" ++ [n] | n <- ['1'..'9']]
