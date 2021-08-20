module Local.Hooks.LayoutHooks where

import XMonad

import XMonad.Config.Desktop

import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile

import XMonad.Hooks.ManageDocks

import Data.Ratio


--------------------------------------------------------------------------------
-- LAYOUTS:
--------------------------------------------------------------------------------
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

myLayout = avoidStruts (tiled ||| Mirror tiled ||| full ||| treeCols ||| grid)
  where
     -- Put space between windows
     tiled    =  mySpacing 4 $ ResizableTall nmaster delta ratio []
     treeCols =  mySpacing 4 $ ThreeColMid nmaster delta ratio
     grid     =  mySpacing 4 $ Grid
     full     =  noBorders Full
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100
