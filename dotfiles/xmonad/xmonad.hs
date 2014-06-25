import XMonad
import XMonad.Actions.CycleWS
import XMonad.Util.Dmenu
import XMonad.Config.Azerty
import XMonad.Config.Xfce
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicHooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Paste
import System.IO
import qualified Data.Map as M
import qualified XMonad.StackSet as W


myTerminal = "xfce4-terminal"
myModMask = mod4Mask

-- Name and create workspaces
myWorkspaces = ["web","dev","media", "graphics"] ++ map show [5..9]

-- Managehooks to autosend to workspaces
-- To find the property name associated with a program, use
-- $ xprop | grep WM_CLASS
-- and click on the client you're interested in. Use the second value, e.g.
-- WM_CLASS(STRING) = "sublime_text", "sublime-text"
--                                     ^^^^^^^^^^^^  Use this

myManageHook = composeAll
    [ className =? "Gimp"                 --> doFloat
    , className =? "Firefox"              --> doShift "web"
    , className =? "sublime-text"         --> doShift "dev"
    , className =? "Vlc"                  --> doShift "media"
    , className =? "Minitube"             --> doShift "media"
    , className =? "Gimp"                 --> doShift "graphics"
    , className =? "Deluge"               --> doShift "media"
--    , className =? "Eclipse"              --> doShift "dev"
    , className =? "jetbrains-phpstorm"   --> doShift "dev"
    , className =? "Spotify"              --> doShift "media"
    
    ]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#dedede"
myFocusedBorderColor = "#d64937"

---------------------
-- The main function.
---------------------

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "[" "]" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

---- Main configuration, override the defaults to your liking.
myConfig = desktopConfig  {
          manageHook = manageDocks <+> manageHook azertyConfig <+> myManageHook
        , layoutHook = avoidStruts  $  layoutHook azertyConfig
        , handleEventHook = ewmhDesktopsEventHook <+> handleEventHook desktopConfig
        , startupHook = ewmhDesktopsStartup
        , logHook = do
            dynamicLogWithPP xmobarPP
        --                { ppOutput = hPutStrLn xmproc
        --                , ppTitle = xmobarColor "green" "" . shorten 50
        --                }
            logHook desktopConfig
        , modMask = myModMask     -- Rebind Mod to the Windows key
        , workspaces = myWorkspaces
        , terminal = myTerminal
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        }
         `additionalKeys`
        [ ((0,               0x1008FF1D), spawn "dmenu_run") -- the calculator key on my Ducky
        , ((0,       xK_Insert ), spawn "amixer sset 'Master',0 toggle") 
        --, ((0,               xK_Insert ), pasteSelection)
        , ((0,               0x1008FF12), spawn "amixer sset 'Master',0 toggle") -- audio mute toggle key on my Ducky
        , ((0,               0x1008FF13), spawn "amixer sset 'Master',0 5%+") -- raise volume key on my Ducky
        , ((0,               0x1008FF11), spawn "amixer sset 'Master',0 5%-") -- lower volume key on my Ducky
        --, ((0, xK_Print),   spawn "scrot  -e 'mv $f ~/screenshots/'") -- take a screenshot
        , ((0, xK_Print),   spawn "xfce4-screenshooter") -- take a screenshot
        , ((0, xK_Break),   spawn "xscreensaver-command --lock") -- lock screen when pressing break key on my Ducky, ((0, xK_Break),   spawn "xscreensaver-command --lock") -- lock screen when pressing break key on my Ducky
        , ((0, xK_Pause),   spawn "xscreensaver-command --lock") -- lock screen when pressing pause key on my Ducky, ((0, xK_Break),   spawn "xscreensaver-command --lock") -- lock screen when pressing break key on my Ducky
        , ((mod4Mask,               xK_Left   ), prevWS)
        , ((mod4Mask,               xK_Right  ), nextWS)
        , ((mod4Mask,               xK_s      ), spawn "dmenu_run")
        ]
