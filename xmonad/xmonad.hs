import XMonad

import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar myConfig

myConfig = defaultConfig 
    { modMask = mod4Mask
    , terminal = "xterm"
    } `additionalKeysP`
                   [ ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
                   , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
                   , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up")
                   , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down")
                   , ("<XF86AudioMute>", spawn "pulseaudio-ctl mute")
                   , ("<Print>", spawn "scrot -e 'mv $f ~/Pictures/screenshots'")
                   , ("M-l", spawn "xsecurelock")
                   , ("M-c", spawn "chromium")
                   , ("M-p", spawn "yeganesh -x | $SHELL")
                   ]
