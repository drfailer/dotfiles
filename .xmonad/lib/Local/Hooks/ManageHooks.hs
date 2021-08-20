module Local.Hooks.ManageHooks where


import XMonad

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import Local.Workspaces.WS

import Data.Monoid


--------------------------------------------------------------------------------
-- Hooks:
--------------------------------------------------------------------------------
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
    [ className =? "vlc"                                 --> doShift ( myWorkspaces !! 8 )
    , className =? "Gimp"                                --> doFloat
    , title =? "sxiv"                                    --> doFloat
    , title =? "Nitrogen"                                --> doFloat
    , title =? "Processing Camera"                       --> doFloat
    , title =? "Discord"                                 --> doShift ( myWorkspaces !! 5 )
    , title =? "Oracle VM VirtualBox Manager"            --> doFloat
    , className =? "VirtualBox Manager"                  --> doShift ( myWorkspaces !! 4 )
    , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
    ]
