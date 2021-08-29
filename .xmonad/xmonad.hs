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
import System.Environment
import System.IO
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import XMonad.Util.Run

import Data.Monoid

import Local.General.Settings
import Local.General.Utils
-- import Data.Kind
--------------------------------------------------------------------------------
-- IMPORTS CONFIG:
--------------------------------------------------------------------------------
import Local.Hooks.LayoutHooks
import Local.Hooks.LogHooks
import Local.Hooks.ManageHooks
import Local.Hooks.StartupHooks
import Local.Keys.Basic
import Local.Keys.BetterKeys
import Local.Keys.MouseBindings
import Local.Themes.Theme
import Local.Workspaces.WS

--------------------------------------------------------------------------------
-- MAIN:
--------------------------------------------------------------------------------
main = do
  xmproc <-
    spawnPipe $ "xmobar -x 0 ~/.config/xmobar/" ++ (xmobarConf currentTheme)
  xmonad $
    docks
      def
        { manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
        , layoutHook = myLayout
        , handleEventHook = mempty
        , startupHook = myStartupHook
        , terminal = myTerminal
        , focusFollowsMouse = myFocusFollowsMouse
        , clickJustFocuses = myClickJustFocuses
        , borderWidth = myBorderWidth
        , modMask = myModMask
        , workspaces = myWorkspaces
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , keys = myKeys
        , mouseBindings = myMouseBindings
        , logHook =
            myLogHook <+>
            dynamicLogWithPP
              xmobarPP
                { ppOutput = hPutStrLn xmproc
                , ppCurrent = colorCurrent currentTheme . wrap " " " "
                , ppHiddenNoWindows = colorHiddenNoWindows currentTheme
                , ppHidden = colorHidden currentTheme . wrap "\"" ""
                , ppTitle = colorTitle currentTheme . shorten 30
                , ppSep = colorSep currentTheme
                , ppVisible = colorVisible currentTheme
                , ppUrgent = xmobarColor "red" "yellow"
                , ppExtras = [windowCount]
                }
        } `additionalKeysP`
    myAdditionalKeys `removeKeysP`
    ["M-S-" ++ [n] | n <- ['1' .. '9']]
