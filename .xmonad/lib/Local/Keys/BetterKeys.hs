module Local.Keys.BetterKeys where

import XMonad
import System.Exit

import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.NamedScratchpad
import XMonad.Util.EZConfig (additionalKeysP, removeKeysP)
import qualified XMonad.StackSet as W

import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile

import XMonad.Actions.FloatKeys

import XMonad.Hooks.ManageDocks

import Local.Prompt.PromptConfig
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.XMonad
import XMonad.Prompt.Shell
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Man
import XMonad.Prompt.Pass

import Local.General.Settings
import Local.General.Utils
import Local.Prompt.PromptConfig
import Local.Prompt.CustomPrompts
import Local.Prompt.CalcPrompt


--------------------------------------------------------------------------------
-- BETTER KEYBINDINGS:
--------------------------------------------------------------------------------
myAdditionalKeys :: [(String, X ())]
myAdditionalKeys =
    [ ("M-p", shellPrompt myXPConfig) -- run prompt

    -- Custom prompts
    , ("M-S-p x", xmonadPrompt myXPConfig)
    , ("M-S-p m", manPrompt myXPConfig)
    , ("M-S-p p", passPrompt myXPConfig)
    , ("M-f", searchPrompt myXPConfig)
    , ("M-S-p s", soundPrompt myXPConfig)
    , ("M-S-p f", configPrompt myXPConfig)
    , ("M-S-p c", calcPrompt myXPConfig)
    -- , ("M-S-p b", brightnessPrompt myXPConfig) (laptop config)

    , ("M-S-q", io (exitWith ExitSuccess))
    , ("M-q", spawn "xmonad --recompile; xmonad --restart")
    , ("M-s", refresh)
    , ("M-S-c", kill)
    , ("M-b", sendMessage ToggleStruts)

    -- Window navigation
    , ("M-<Tab>", windows W.focusDown)
    , ("M-j", windows W.focusDown)
    , ("M-k", windows W.focusUp)
    , ("M-l", (windows W.focusMaster) >> (windows W.focusUp)) -- try
    , ("M-h", windows W.focusMaster) -- try
    , ("M-m", windows W.focusMaster)
    , ("M-<Return>", windows W.swapMaster)
    , ("M-t", withFocused toggleFloat)

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
    , ("M-S-C-l", withFocused (keysResizeWindow (50, 0) (0, 1)))
    , ("M-S-C-h", withFocused (keysResizeWindow (-50, -0) (0, 1)))
    , ("M-S-C-k", withFocused (keysResizeWindow (0, -50) (0, 0)))
    , ("M-S-C-j", withFocused (keysResizeWindow (0, 50) (0, 0)))

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
    , ("M-S-a q", spawn "qutebrowser")

    -- dmenu scripts
    -- , ("M-p", spawn "dmenu_run -p 'Run:'")
    -- , ("M-f", spawn "exec ~/.scripts/dmenu/search/search")
    -- , ("M-S-p s", spawn "exec ~/.scripts/dmenu/sound/sound")
    -- , ("M-S-p c", spawn "exec ~/.scripts/dmenu/editconf/editconf")
    , ("M-n r", spawn "exec ~/.scripts/dmenu/notes/read-note")
    , ("M-n e", spawn "exec ~/.scripts/dmenu/notes/edit-notes")

    -- Spacing: windows and borders
    , ("M-i", (incWindowSpacing 10))
    , ("M-u", (decWindowSpacing 10))
    , ("M-S-i", (incScreenSpacing 10))
    , ("M-S-u", (decScreenSpacing 10))
    , ("M-S-b", (toggleScreenSpacingEnabled >> toggleWindowSpacingEnabled))
    ]
