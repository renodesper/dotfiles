------------------------------------------------------------------------
-- Import --
------------------------------------------------------------------------
import System.Exit
import System.IO
import XMonad
import XMonad.Actions.CycleWindows
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (manageDocks, avoidStruts)
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.IM
import XMonad.Layout.MultiToggle
import XMonad.Layout.SimplestFloat
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.StackTile
import XMonad.Layout.Tabbed
import XMonad.Layout.WindowArranger
import XMonad.Layout.Minimize
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.Run (safeSpawn, spawnPipe, hPutStrLn)
import qualified Data.Map                 as M
import qualified GHC.IO.Handle.Types      as H
import qualified XMonad.Layout.Fullscreen as FS
import qualified XMonad.StackSet          as W

------------------------------------------------------------------------
-- Key bindings --
------------------------------------------------------------------------
myKeys ::  XConfig l -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
    -- Tutup fokus window dan Keluar dari Xmonad
          ((modm,xK_q)                                , spawn "xmonad --recompile; killall conky dzen2 compton mpd mpd-notification thunar synapse hhp; xmonad --restart")
        -- , ((modm .|. shiftMask,xK_q)                  , spawn "killall conky dzen2 compton mpd mpd-notification thunar synapse; io (exit With Exit Success)")
        , ((modm .|. shiftMask,xK_q)                  , spawn "poweroff")
        , ((modm,xK_x)                                , kill)
    -- Ganti ke layout selanjutnya
        , ((modm,xK_space)                            , sendMessage NextLayout)
    -- Pindah Wokspaces
        , ((modm,xK_Right)                            , nextWS)
        , ((modm,xK_Left)                             , prevWS)
    -- Fokus ke workspace yang urgent
        , ((modm, xK_u)                               , focusUrgent)
    -- Memindahkan client ke workspace lain lalu pindahkan fokus ke workspace tersebut
        , ((modm .|. shiftMask,xK_Right)              , shiftToNext)
        , ((modm .|. shiftMask,xK_Left)               , shiftToPrev)
    -- Memindahkan client ke workspace lain
        , ((modm .|. shiftMask .|. mod1Mask,xK_Right) , shiftToNext >> nextWS)
        , ((modm .|. shiftMask .|. mod1Mask,xK_Left)  , shiftToPrev >> prevWS)
    -- Tukar Fokus window
        , ((modm,xK_j)                                , windows W.focusDown  )
        , ((modm,xK_k)                                , windows W.focusUp    )
        , ((modm,xK_m)                                , windows W.focusMaster)
    -- Geser Fokus Window
        , ((modm .|. shiftMask,xK_space)              , windows W.swapMaster)
        , ((modm .|. shiftMask,xK_j)                  , windows W.swapDown  )
        , ((modm .|. shiftMask,xK_k)                  , windows W.swapUp    )
    -- Susutkan ukuran window
        , ((modm,xK_h)                                , sendMessage Shrink)
        , ((modm,xK_l)                                , sendMessage Expand)
    -- Mengatur window ke tilling mode
        , ((modm,xK_t)                                , withFocused $ windows . W.sink)
    -- Mengatur jumlah window di master
        , ((modm .|. shiftMask,xK_m)                  , sendMessage(IncMasterN(1)))
        , ((modm .|. shiftMask,xK_n)                  , sendMessage(IncMasterN(-1)))
    -- Fullscreen window
        , ((modm,xK_f)                                , sendMessage $ Toggle FULL)
    -- Minimize Window
        , ((modm,xK_i)                                , withFocused minimizeWindow)
        , ((modm .|. shiftMask,xK_i)                  , sendMessage RestoreNextMinimizedWin)
    -- Aplikasi
        , ((modm,xK_Return)                           , spawn "terminator")
        , ((modm .|. shiftMask,xK_Return)             , spawn $ XMonad.terminal conf)
        , ((modm .|. shiftMask,xK_s)                  , spawn "physlock")
        , ((modm,xK_c)                                , spawn "sh /home/$USER/.xmonad/Scripts/calendar")
        , ((modm .|. shiftMask,xK_c)                  , spawn "sh /home/$USER/.xmonad/Scripts/clock")
        , ((modm,xK_bracketleft)                      , spawn "synclient TouchpadOff=1")
        , ((modm .|. shiftMask,xK_bracketleft)        , spawn "synclient TouchpadOff=0")
        , ((modm,xK_bracketright)                     , spawn "setxkbmap dvorak;xmodmap -e 'keycode 108 = Super_L';xmodmap -e 'remove mod1 = Super_L'")
        , ((modm .|. shiftMask,xK_bracketright)       , spawn "setxkbmap us;xmodmap -e 'keycode 108 = Super_L';xmodmap -e 'remove mod1 = Super_L'")
        , ((modm,xK_semicolon)                        , spawn "subl3")
        , ((modm,xK_apostrophe)                       , safeSpawn "luakit" [])
    -- Pengaturan mpc dan volume
        , ((modm,xK_comma)                            , spawn "mpc toggle")
        , ((modm,xK_period)                           , spawn "mpc stop")
        , ((modm .|. shiftMask,xK_comma)              , spawn "mpc prev")
        , ((modm .|. shiftMask,xK_period)             , spawn "mpc next")
    -- Function Key
        , ((0, 0x1008FF12), spawn "amixer -q set Master toggle")  -- XF86XK_AudioMute
        , ((0, 0x1008FF11), spawn "pulseaudio-ctl down 2")  -- XF86XK_AudioLowerVolume
        , ((0, 0x1008FF13), spawn "pulseaudio-ctl up 2")  -- XF86XK_AudioRaiseVolume
        , ((0, 0x1008FFB2), spawn "amixer set Capture toggle")  -- XF86XK_AudioMicMute
        , ((0, 0x1008FF03), spawn "light -U 2; light -O")  -- XF86XK_MonBrightnessDown
        , ((0, 0x1008FF02), spawn "light -A 2; light -O")  -- XF86XK_MonBrightnessUp
        , ((0, 0x1008FF59), spawn "light -S 0")  -- XF86XK_Display
        , ((0, 0x1008FF95), spawn "urxvt -e sudo wifi-menu")  -- XF86XK_WLAN
        , ((0, 0x1008FF81), spawn "gvim ~/.xmonad/xmonad.hs")  -- XF86XK_Tools
        , ((0, 0x1008FF1B), spawn "dmenu_run -h 18 -fn 'Play-9' -nb '#000000' -sb '#000000' -sf '#e60926' -x 0 -y 0 -dim 0.8")  -- XF86XK_Search
        , ((0, 0x1008FF4A), goToSelected defaultGSConfig)  -- XF86XK_LaunchA
        , ((0, 0x1008FF5D), spawn "thunar")  -- XF86XK_Explorer
    -- Increment and decrement the size of windows
        -- , ((modm .|. controlMask              , xK_s    ), sendMessage Arrange         )
        -- , ((modm .|. controlMask .|. shiftMask, xK_s    ), sendMessage DeArrange       )
        -- , ((modm .|. controlMask              , xK_Left ), sendMessage (MoveLeft      1))
        -- , ((modm .|. controlMask              , xK_Right), sendMessage (MoveRight     1))
        -- , ((modm .|. controlMask              , xK_Down ), sendMessage (MoveDown      1))
        -- , ((modm .|. controlMask              , xK_Up   ), sendMessage (MoveUp        1))
        -- , ((modm                 .|. shiftMask, xK_Left ), sendMessage (IncreaseLeft  1))
        -- , ((modm                 .|. shiftMask, xK_Right), sendMessage (IncreaseRight 1))
        -- , ((modm                 .|. shiftMask, xK_Down ), sendMessage (IncreaseDown  1))
        -- , ((modm                 .|. shiftMask, xK_Up   ), sendMessage (IncreaseUp    1))
        -- , ((modm .|. controlMask .|. shiftMask, xK_Left ), sendMessage (DecreaseLeft  1))
        -- , ((modm .|. controlMask .|. shiftMask, xK_Right), sendMessage (DecreaseRight 1))
        -- , ((modm .|. controlMask .|. shiftMask, xK_Down ), sendMessage (DecreaseDown  1))
        -- , ((modm .|. controlMask .|. shiftMask, xK_Up   ), sendMessage (DecreaseUp    1))
    ]

    ++
    -- mod-[1..9], Pindah ke workspace N
    -- mod-shift-[1..9], Memindahkan client ke workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [ xK_1..xK_7 ]
        , (f, m) <- [(W.greedyView, 0)
        , (W.shift, shiftMask)]]

    ++
    -- mod-{w,e,r}, Pindah ke layar Xinerama 1, 2, atau 3
    -- mod-shift-{w,e,r}, Memindahkan client ke xinerama 1, 2, atau 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Nama layout dan key untuk mempercepat akses
------------------------------------------------------------------------
myWorkspaces :: [String]
myWorkspaces = clickable . (map dzenEscape) $ [ " Web ", " Code ", " Chat ", " Office ", " Graphic ", " Game ", " Other "]
    where clickable l = [ "^ca(1,xdotool key super+"
                        ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                        (i,ws) <- zip [ 1.. ] l,
                        let n = i ]

------------------------------------------------------------------------
-- Pengaturan Tetikus --
------------------------------------------------------------------------
myMouseBindings :: XConfig t -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                      >> windows W.shiftMaster)
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w)
    ]

------------------------------------------------------------------------
-- Aturan untuk Window --
-- Catatan: Gunakan "xprop | grep WM_CLASS"
------------------------------------------------------------------------
myManageHook ::  ManageHook
myManageHook = composeAll . concat $
    [ [resource  =? r --> doIgnore                         | r <- myIgnores]    -- ignore desktop
    , [className =? c --> doShift (myWorkspaces !! 0)      | c <- myWebs   ]    -- move myWebs windows to workspace web by classname
    , [className =? c --> doShift (myWorkspaces !! 1)      | c <- myCodes  ]    -- move myCodes windows to workspace code by classname
    , [className =? c --> doShift (myWorkspaces !! 2)      | c <- myChats  ]    -- move myChats windows to workspace chat by classname
    , [className =? c --> doShift (myWorkspaces !! 3)      | c <- myOffices]    -- move myOffices windows to workspace office by classname
    , [className =? c --> doShift (myWorkspaces !! 4)      | c <- myGfxs   ]    -- move myGfxs windows to workspace gfx by classname
    , [className =? c --> doShiftAndGo (myWorkspaces !! 5) | c <- myGames  ]    -- move myGames windows to workspace game by classname
    , [className =? c --> doShift (myWorkspaces !! 6)      | c <- myOthers ]    -- move myOthers windows to workspace other by classname
    , [className =? c --> doCenterFloat                    | c <- myFloatCC]    -- float center geometry by classname
    , [name      =? n --> doCenterFloat                    | n <- myFloatCN]    -- float center geometry by name
    , [name      =? n --> doSideFloat NW                   | n <- myFloatSN]    -- float side NW geometry by name
    , [className =? c --> doF W.focusDown                  | c <- myFocusDC]    -- dont focus on launching by classname
    , [isFullscreen   --> doFullFloat]
    ]
    where
        doShiftAndGo ws = doF (W.greedyView ws) <+> doShift ws
        role            = stringProperty "WM_WINDOW_ROLE"
        name            = stringProperty "WM_NAME"
        myIgnores       = [ "desktop", "desktop_window" ]
        myWebs          = [ ]
        myOffices       = [ "libreoffice", "libreoffice-startcenter"
                          , "libreoffice-writer", "libreoffice-calc"
                          , "libreoffice-impress", "libreoffice-draw"
                          , "libreoffice-base", "libreoffice-math"
                          , "Evince", "Texmaker", "Wps", "Wpp", "Et"]
        myCodes         = [ "NetBeans IDE 7.2", "Adl", "jetbrains-android-studio"
                          , "jetbrains-idea", "jetbrains-pycharm-ce" ]
        myGfxs          = [ "Gimp-2.8", "Inkscape" ]
        myChats         = [ "Pidgin", "Xchat" ]
        myGames         = [ "zsnes" ]
        myOthers        = [ "Amule", "Transmission-gtk", "libprs500" ]
        myFloatCC       = [ "MPlayer", "mplayer2", "File-roller", "zsnes"
                          , "Gcalctool", "Exo-helper-1", "Gksu", "PSX"
                          , "Galculator", "Nvidia-settings", "XFontSel"
                          , "XCalc", "XClock", "Desmume", "Ossxmix", "Xvidcap"
                          , "Main", "Wicd-client.py"
                          , "com-mathworks-util-PostVMInit", "MATLAB"
                          , "Smplayer", "URxvt" ]
        myFloatCN       = [ "ePSXe - Enhanced PSX emulator"
                          , "Seleccione Archivo", "Config Video"
                          , "Testing plugin", "Config Sound", "Config Cdrom"
                          , "Config Bios", "Config Netplay", "Config Memcards"
                          , "About ePSXe", "Config Controller"
                          , "Config Gamepads", "Select one or more files to open"
                          , "Add media", "Choose a file", "Open File"
                          , "Open Image", "File Operation Progress"
                          , "Password Required", "Firefox Preferences"
                          , "Preferences", "Search Engines", "Set up sync"
                          , "Passwords and Exceptions", "Autofill Options"
                          , "Rename File", "Copying files", "Moving files"
                          , "File Properties", "Replace", "Viewnior Preferences"
                          , "Close All Images", "Quit GIMP", "Delete message(s)"
                          , "Event Tester"]
        myFloatSN       = []
        myFocusDC       = [ "Event Tester", "Notify-osd" ]

------------------------------------------------------------------------
-- Definisi Warna --
------------------------------------------------------------------------
grey = "#EEEEEE"
black = "#333333"
white = "#FFFFFF"

-- color1 & color3 for myLogHook
-- color2 & color4 for toprightbar

-- Red Blue om Eko
-- color1 = "#82AFF9"
-- color2 = "#9881F5"
-- color3 = "#F97D81"
-- color4 = "#F9D08B"

color1 = "#00B454"
color2 = "#78E700"
color3 = "#086CA2"
color4 = "#FF3900"

------------------------------------------------------------------------
-- Status bars and logging --
------------------------------------------------------------------------
myLogHook ::  H.Handle -> X ()
myLogHook h = dynamicLogWithPP $ dzenPP
    { ppCurrent           = dzenColor (white) (color3) . pad
    , ppVisible           = dzenColor (white) (color1) . pad
    , ppHidden            = dzenColor (white) (color1) . pad
    , ppHiddenNoWindows   = dzenColor (black) (white) . pad
    , ppUrgent            = dzenColor (white) (color4) . pad
    , ppWsSep             = ""
    , ppSep               = "   "
    , ppLayout            = dzenColor (black) (white) .
        (\x -> case x of
            "Minimize Spacing 20 Tall"             -> clickInLayout ++ icon1
            "Minimize Tall"                        -> clickInLayout ++ icon2
            "Minimize Mirror Spacing 20 Tall"      -> clickInLayout ++ icon3
            "Minimize Full"                        -> clickInLayout ++ icon4
            "Minimize StackTile"                   -> clickInLayout ++ icon5
            "Minimize SimplestFloat"               -> clickInLayout ++ icon6
            "Minimize Tabbed Simplest"             -> clickInLayout ++ icon7
            "Minimize Mirror Spacing 0 StackTile"  -> clickInLayout ++ icon8
            "Minimize Mirror Spacing 0 Tall"       -> clickInLayout ++ icon9
            _ -> x
        )
    , ppTitle             = (" " ++) . dzenColor (black) (white) . dzenEscape
    , ppOutput            = hPutStrLn h
    }
    where icon1 = "^i(/home/renodesper/.xmonad/icons/tile.xbm)^ca()"
          icon2 = "^i(/home/renodesper/.xmonad/icons/monocle.xbm)^ca()"
          icon3 = "^i(/home/renodesper/.xmonad/icons/bstack.xbm)^ca()"
          icon4 = "^i(/home/renodesper/.xmonad/icons/monocle2.xbm)^ca()"
          icon5 = "^i(/home/renodesper/.xmonad/icons/bstack2.xbm)^ca()"
          icon6 = "^i(/home/renodesper/.xmonad/icons/float.xbm)^ca()"
          icon7 = "^i(/home/renodesper/.xmonad/icons/grid.xbm)^ca()"
          icon8 = "^i(/home/renodesper/.xmonad/icons/bstack3.xbm)^ca()"
          icon9 = "^i(/home/renodesper/.xmonad/icons/monocle2.xbm)^ca()"

clickInLayout :: String
clickInLayout = "^ca(1, xdotool key super+space)"

------------------------------------------------------------------------
-- Tabbed theme --
------------------------------------------------------------------------
myTabbedTheme :: Theme
myTabbedTheme = defaultTheme
    { fontName            = "xft:Play:size=8"
    , inactiveBorderColor = white
    , inactiveColor       = white
    , inactiveTextColor   = black
    , activeBorderColor   = color3
    , activeColor         = color3
    , activeTextColor     = white
    , urgentBorderColor   = color3
    , urgentColor         = color3
    , urgentTextColor     = white
    }

------------------------------------------------------------------------
-- Layouts --
------------------------------------------------------------------------
myLayout = mkToggle (NOBORDERS ?? FULL ?? EOT) $
    avoidStruts $
    standardLayout
    where
        standardLayout    = minimize
                              $ tabbed shrinkText myTabbedTheme
                            ||| fullTiled
                            ||| tiled
                            -- ||| float
        tiled             = spacing 20 $ Tall nmaster delta ratio
        hozTiled          = StackTile 1 delta ratio
        verTiled          = Mirror . spacing 0 $ StackTile 1 delta ratio
        -- fullTiled         = Tall nmaster delta ratio
        fullTiled         = Tall 1 delta ratio
        mirrorTiled       = Mirror . spacing 20 $ Tall nmaster delta ratio
        mirrorFullTiled   = Mirror . spacing 0 $ Tall nmaster delta ratio
        focused           = gaps [(L,10), (R,10), (U,10), (D,10)] $ noBorders (FS.fullscreenFull Full)
        -- float             = simplestFloat
        nmaster = 1      -- The default number of windows in the master pane
        delta   = 2/100  -- Percent of screen to increment by when resizing pane
        ratio   = 1/2    -- Default proportion of screen occupied by master pane

------------------------------------------------------------------------
-- Jalankan Xmonad --
------------------------------------------------------------------------
main :: IO ()
main = do
    logHookPanel  <- spawnPipe "DISPLAY=:0 sh /home/$USER/.xmonad/Scripts/loghook"
    spawnPipe "DISPLAY=:0 sh /home/$USER/.xmonad/Scripts/toprightbar"
    -- spawnPipe "DISPLAY=:0 sh /home/$USER/.xmonad/Scripts/bottomrightbar"
    spawn "DISPLAY=:0 sh /home/$USER/.autostart.sh"
    xmonad  $ withUrgencyHook NoUrgencyHook
    -- xmonad  $ withUrgencyHook dzenUrgencyHook
    --         { args = [ "-x", "0", "-y", "335", "-h", "98"
    --                     , "-w", "1366", "-fn", "Poiret One-32"
    --                     , "-fg", white, "-bg", color3, "-xs", "1", "-e"
    --                     , "onstart=uncollapse;button1=exit;key_Escape=exit"
    --                     ]
    --         }
            $ defaultConfig
            { terminal              = "urxvt"
            , focusFollowsMouse     = False
            , clickJustFocuses      = False
            , borderWidth           = 4
            , modMask               = mod4Mask
            , normalBorderColor     = color1
            , focusedBorderColor    = color3
            , workspaces            = myWorkspaces
            , keys                  = myKeys
            , mouseBindings         = myMouseBindings
            , logHook               = myLogHook logHookPanel
            , layoutHook            = windowArrange myLayout
            , manageHook            = myManageHook <+> manageDocks
            , handleEventHook       = FS.fullscreenEventHook
            -- , startupHook           = setWMName "LG3D"
            }
