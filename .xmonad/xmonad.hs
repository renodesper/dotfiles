------------------------------------------------------------------------
-- Impor --
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
import XMonad.Prompt.Man
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
    -- Prompt
          ((modm,xK_p)                                , spawn "dmenu_run -h 18 -fn 'Artwiz-8' -nb '#000000' -sb '#000000' -sf '#e60926' -x 150 -y 750 -w 533 -dim 0.8")
        , ((modm .|. shiftMask,xK_p)                  , manPrompt myXPConfig)
    -- Tutup fokus window dan Keluar dari Xmonad
        , ((modm .|. shiftMask,xK_q)                  , spawn "killall conky dzen2 compton mpd; io (exit With Exit Success)")
        , ((modm .|. shiftMask,xK_c)                  , kill)
        , ((mod1Mask,xK_F4)                           , kill)
    -- Ganti Layout dan kembali ke default
        , ((modm,xK_space)                            , sendMessage NextLayout)
    -- Pindah Wokspaces
        , ((modm,xK_Right)                            , nextWS)
        , ((modm,xK_Left)                             , prevWS)
    -- Fokus ke workspace yang urgent
        , ((modm, xK_x)                               , focusUrgent)
    -- Memindahkan client ke workspace lain
        , ((modm .|. shiftMask,xK_Right)              , shiftToNext >> nextWS)
        , ((modm .|. shiftMask,xK_Left)               , shiftToPrev >> prevWS)
    -- Memindahkan client ke workspace lain lalu pindahkan fokus ke workspace tersebut
        , ((modm .|. shiftMask .|. mod1Mask,xK_Right) , shiftToNext)
        , ((modm .|. shiftMask .|. mod1Mask,xK_Left)  , shiftToPrev)
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
    -- Mengatur window biar ke tilling mode
        , ((modm,xK_t)                                , withFocused $ windows . W.sink)
    -- Increment and decrement the size of windows
    --    , ((modm .|. controlMask              , xK_s    ), sendMessage Arrange         )
    --    , ((modm .|. controlMask .|. shiftMask, xK_s    ), sendMessage DeArrange       )
    --    , ((modm .|. controlMask              , xK_Left ), sendMessage (MoveLeft      1))
    --    , ((modm .|. controlMask              , xK_Right), sendMessage (MoveRight     1))
    --    , ((modm .|. controlMask              , xK_Down ), sendMessage (MoveDown      1))
    --    , ((modm .|. controlMask              , xK_Up   ), sendMessage (MoveUp        1))
    --    , ((modm                 .|. shiftMask, xK_Left ), sendMessage (IncreaseLeft  1))
    --    , ((modm                 .|. shiftMask, xK_Right), sendMessage (IncreaseRight 1))
    --    , ((modm                 .|. shiftMask, xK_Down ), sendMessage (IncreaseDown  1))
    --    , ((modm                 .|. shiftMask, xK_Up   ), sendMessage (IncreaseUp    1))
    --    , ((modm .|. controlMask .|. shiftMask, xK_Left ), sendMessage (DecreaseLeft  1))
    --    , ((modm .|. controlMask .|. shiftMask, xK_Right), sendMessage (DecreaseRight 1))
    --    , ((modm .|. controlMask .|. shiftMask, xK_Down ), sendMessage (DecreaseDown  1))
    --    , ((modm .|. controlMask .|. shiftMask, xK_Up   ), sendMessage (DecreaseUp    1))
    -- Fullscreen window
        , ((modm,xK_f)                                , sendMessage $ Toggle FULL)
    -- GridSelect
        , ((modm, xK_g)                               , goToSelected defaultGSConfig)
    -- Minimize Window
        , ((modm,xK_i)                                , withFocused minimizeWindow)
        , ((modm .|. shiftMask,xK_i)                  , sendMessage RestoreNextMinimizedWin)
    -- Aplikasi
        , ((modm,xK_Return)                           , spawn "urxvtc")
        , ((modm .|. shiftMask,xK_Return)             , spawn $ XMonad.terminal conf)
        , ((modm,xK_bracketleft)                      , spawn "thunar")
        , ((modm,xK_bracketright)                     , spawn "subl3")
        , ((modm,xK_b)                                , safeSpawn "luakit" [])
        , ((modm .|. shiftMask,xK_s)                  , spawn "slimlock")
        , ((modm,xK_c)                                , spawn "bash /home/$USER/.xmonad/Scripts/clock")
        , ((modm,xK_F9)                               , spawn "synclient TouchpadOff=0")
        , ((modm .|. shiftMask,xK_F9)                 , spawn "synclient TouchpadOff=1")
        , ((modm,xK_q)                                , spawn "xmonad --recompile; killall conky dzen2; xmonad --restart")
    -- Pengaturan mpc dan volume
        , ((modm .|. shiftMask,xK_comma)              , spawn "mpc toggle")
        , ((modm,xK_comma)                            , spawn "mpc prev")
        , ((modm,xK_period)                           , spawn "mpc next")
        , ((modm .|. shiftMask,xK_period)             , spawn "mpc stop")
        , ((modm .|. shiftMask,xK_v)                  , spawn "amixer -q set Master 2%- unmute")
        , ((modm,xK_v)                                , spawn "amixer -q set Master 2%+ unmute")
    ]

    ++
    -- mod-[1..9], Pindah ke workspace N
    -- mod-shift-[1..9], Memindahkan client ke workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1,xK_2,xK_3,xK_4,xK_5,xK_6,xK_7]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

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
myWorkspaces        = clickable . (map dzenEscape) $ [" α "," β "," γ "," δ "," ε "," ϛ "," ζ "]
  where clickable l = [ "^ca(1,xdotool key super+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                            (i,ws) <- zip [1..] l,
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
--    -- Horizontal scroll wheel for next/prev workspace
--    ++ map (second const) (prevNextWorkspaceBindings modMask button4 button5)

--prevNextWorkspaceBindings :: KeyMask -> a -> a -> [((KeyMask, a), X ())]
--prevNextWorkspaceBindings modMask prev next =
--    [ ((modm, button4),   nextWS)
--    , ((modm, button5),   prevWS)
--    ]

------------------------------------------------------------------------
-- Aturan untuk Window --
------------------------------------------------------------------------
-- Catatan: Untuk menemukan nama spesial dari aplikasi, pake ini :
-- > xprop | grep WM_CLASS
-- Terus klik window yang ingin didapatkan nama specialnya :D
------------------------------------------------------------------------
myManageHook ::  ManageHook
myManageHook = composeAll . concat $
    [ [resource  =? r --> doIgnore                         | r <- myIgnores] --ignore desktop
    , [className =? c --> doShift (myWorkspaces !! 0)      | c <- myWebs   ] --move myWebs windows to workspace 0 by classname
    , [className =? c --> doShift (myWorkspaces !! 1)      | c <- myOffices] --move myOffices windows to workspace 1 by classname
    , [className =? c --> doShift (myWorkspaces !! 2)      | c <- myGfxs   ] --move myGfxs windows to workspace 2 by classname
    , [className =? c --> doShift (myWorkspaces !! 3)      | c <- myCodes  ] --move myCodes windows to workspace 3 by classname
    , [className =? c --> doShift (myWorkspaces !! 4)      | c <- myChats  ] --move myChats windows to workspace 4 by classname
    , [className =? c --> doShiftAndGo (myWorkspaces !! 5) | c <- myGames  ] --move myGames windows to workspace 5 by classname and shift
    , [className =? c --> doShift (myWorkspaces !! 6)      | c <- myOthers ] --move myOthers windows to workspace 6 by classname and shift
    , [className =? c --> doCenterFloat                    | c <- myFloatCC] --float center geometry by classname
    , [name      =? n --> doCenterFloat                    | n <- myFloatCN] --float center geometry by name
    , [name      =? n --> doSideFloat NW                   | n <- myFloatSN] --float side NW geometry by name
    , [className =? c --> doF W.focusDown                  | c <- myFocusDC] --dont focus on launching by classname
    , [isFullscreen   --> doFullFloat]
    ] where
        doShiftAndGo ws = doF (W.greedyView ws) <+> doShift ws
        role            = stringProperty "WM_WINDOW_ROLE"
        name            = stringProperty "WM_NAME"
        myIgnores       = ["desktop", "desktop_window"]
        myWebs          = ["Chromium", "Google-chrome", "Firefox", "Opera", "Midori", "Claws Mail"]
        myOffices       = ["libreoffice-startcenter", "libreoffice-writer", "libreoffice-calc", "libreoffice-impress", "libreoffice-draw", "libreoffice-base", "libreoffice-math"
                          , "Evince", "Texmaker", "Wps", "Wpp", "Et"]
        myCodes         = ["NetBeans IDE 7.2", "Adl"]
        myGfxs          = ["Gimp-2.8", "Inkscape"]
        myChats         = ["Pidgin", "Xchat"]
        myGames         = ["zsnes"]
        myOthers        = ["Amule", "Transmission-gtk"]
        myFloatCC       = ["MPlayer", "mplayer2", "File-roller", "zsnes", "Gcalctool", "Exo-helper-1", "Gksu", "PSX", "Galculator", "Nvidia-settings", "XFontSel"
                          , "XCalc", "XClock", "Desmume", "Ossxmix", "Xvidcap", "Main", "Wicd-client.py", "com-mathworks-util-PostVMInit", "MATLAB", "Smplayer"
                          , "libreoffice-startcenter", "libreoffice-writer", "libreoffice-calc", "libreoffice-impress", "libreoffice-draw", "libreoffice-base", "libreoffice-math"]
        myFloatCN       = ["ePSXe - Enhanced PSX emulator", "Seleccione Archivo", "Config Video", "Testing plugin", "Config Sound", "Config Cdrom", "Config Bios"
                          , "Config Netplay", "Config Memcards", "About ePSXe", "Config Controller", "Config Gamepads", "Select one or more files to open"
                          , "Add media", "Choose a file", "Open File", "Open Image", "File Operation Progress", "Password Required", "Firefox Preferences", "Preferences", "Search Engines"
                          , "Set up sync", "Passwords and Exceptions", "Autofill Options", "Rename File", "Copying files", "Moving files", "File Properties", "Replace"
                          , "Viewnior Preferences", "Close All Images", "Quit GIMP", "Delete message(s)"]
        myFloatSN       = ["Event Tester"]
        myFocusDC       = ["Event Tester", "Notify-osd"]

------------------------------------------------------------------------
-- Status bars and logging --
------------------------------------------------------------------------
myLogHook ::  H.Handle -> X ()
myLogHook h = dynamicLogWithPP $ dzenPP
    {
        ppCurrent           =   dzenColor (colLook Red   0)
                                          (colLook Black 0) . pad
      , ppVisible           =   dzenColor (colLook Cyan  0)
                                          (colLook Black 0) . pad
      , ppHidden            =   dzenColor (colLook Cyan  0)
                                          (colLook BG    0) . pad
      , ppHiddenNoWindows   =   dzenColor (colLook White 0)
                                          (colLook BG    0) . pad
      , ppUrgent            =   dzenColor (colLook White 0)
                                          (colLook Red   0) . pad
      , ppWsSep             =   ""
      , ppSep               =   " | "
      , ppLayout            =   dzenColor (colLook Red 0) "#000000" .
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
                _                             -> x
            )
      , ppTitle             =   (" " ++) . dzenColor "white" "#000000" . dzenEscape
      , ppOutput            =   hPutStrLn h
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
  { fontName            = "xft:Artwiz:size=8"
  , inactiveBorderColor = "#000000"
  , inactiveColor       = "#020202"
  , inactiveTextColor   = "#ffffff"
  , activeBorderColor   = "#000000"
  , activeColor         = "#000000"
  , activeTextColor     = "#e60926"
  , urgentBorderColor   = "#000000"
  , urgentTextColor     = "#ffffff"
  }

------------------------------------------------------------------------
-- Definisi Warna --
------------------------------------------------------------------------
type Hex = String
type ColorCode = (Hex,Hex)
type ColorMap = M.Map Colors ColorCode

data Colors = Black | Red | Green | Yellow | Blue | Magenta | Cyan | White | BG
    deriving (Ord,Show,Eq)

colLook :: Colors -> Int -> Hex
colLook color n =
    case M.lookup color colors of
        Nothing -> "#000000"
        Just (c1,c2) -> if n == 0
                        then c1
                        else c2

colors :: ColorMap
colors = M.fromList
    [ (Black   , ("#000000",
                  "#121212"))
    , (Red     , ("#e60926",
                  "#df2821"))
    , (Green   , ("#219e74",
                  "#219579"))
    , (Yellow  , ("#218c7e",
                  "#218383"))
    , (Blue    , ("#217a88",
                  "#21728d"))
    , (Magenta , ("#216992",
                  "#216097"))
    , (Cyan    , ("#21579c",
                  "#214ea1"))
    , (White   , ("#ffffff",
                  "#a3a3a3"))
    , (BG      , ("#000000",
                  "#444444"))
    ]

------------------------------------------------------------------------
-- Prompt Theme --
------------------------------------------------------------------------
myXPConfig :: XPConfig
myXPConfig = defaultXPConfig
  { font              = "Artwiz-8"
  , bgColor           = "#020202"
  , fgColor           = "#a9a6af"
  , bgHLight          = "#44aacc"
  , fgHLight          = "#020202"
  , borderColor       = "#101010"
  , promptBorderWidth = 0
  , height            = 18
  , position          = Bottom
  , historySize       = 100
  , historyFilter     = deleteConsecutive
  , autoComplete      = Nothing
  }

------------------------------------------------------------------------
-- Jalankan Xmonad --
------------------------------------------------------------------------
main :: IO ()
main = do
    d <- spawnPipe "bash /home/$USER/.xmonad/Scripts/loghook"
    spawn "bash /home/$USER/.xmonad/Scripts/status"
    xmonad $ withUrgencyHook dzenUrgencyHook { args = ["-x", "0", "-y", "335", "-h", "98", "-w", "1366", "-fn", "Poiret One-32", "-bg",
                                                       "#000000", "-xs", "1", "-e", "onstart=uncollapse;button1=exit;key_Escape=exit"] } $ defaultConfig {
        terminal                  = "urxvt",
        focusFollowsMouse         = False,
        clickJustFocuses          = False,
        borderWidth               = 3,
        modMask                   = mod4Mask,
        normalBorderColor         = colLook BG 1,
        focusedBorderColor        = colLook Black 1,
        workspaces                = myWorkspaces,
        keys                      = myKeys,
        mouseBindings             = myMouseBindings,
        logHook                   = myLogHook d,
        layoutHook                = windowArrange myLayout,
        manageHook                = myManageHook <+> manageDocks,
        handleEventHook           = FS.fullscreenEventHook ,
        startupHook               = setWMName "LG3D"
    }
    where
          -- Layouts --
          myLayout = mkToggle (NOBORDERS ?? FULL ?? EOT) $
              avoidStruts $
              standardLayout
              where
                  standardLayout = minimize
                                     $ tabbed shrinkText myTabbedTheme
                                   ||| tiled
                                   ||| fullTiled
                                   ||| mirrorTiled
                                   ||| mirrorFullTiled
                                   ||| float
                  tiled          = spacing 20 $ Tall nmaster delta ratio
                  hozTiled       = StackTile 1 delta ratio
                  verTiled       = Mirror . spacing 0 $ StackTile 1 delta ratio
                  fullTiled      = Tall nmaster delta ratio
                  mirrorTiled    = Mirror . spacing 20 $ Tall nmaster delta ratio
                  mirrorFullTiled= Mirror . spacing 0 $ Tall nmaster delta ratio
                  focused        = gaps [(L,10), (R,10),(U,10),(D,10)] $ noBorders (FS.fullscreenFull Full)
                  float          = simplestFloat
                  -- The default number of windows in the master pane
                  nmaster = 1
                  -- Percent of screen to increment by when resizing panes
                  delta   = 2/100
                  -- Default proportion of screen occupied by master pane
                  ratio   = 3/5
