import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.SetWMName

import XMonad.Layout.Fullscreen
import XMonad.Layout.Circle
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed

import XMonad.Actions.FindEmptyWorkspace
import XMonad.Actions.GridSelect
import XMonad.Actions.NoBorders

import XMonad.Actions.SpawnOn

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

startupToggle = True

flipToggle True f = f
flipToggle _ f    = return () 

myGsConfig = defaultGSConfig { gs_cellheight = 120, gs_cellwidth = 300 }
gsconfig2 colorizer = (buildDefaultGSConfig colorizer) { gs_cellheight = 120, gs_cellwidth = 300 }

-- | A green monochrome colorizer based on window class
myColorizer = colorRangeFromClassName
    black -- lowest inactive bg
    red   -- highest inactive bg
    pink  -- active bg
    cyan  -- inactive fg
    black -- active fg
  where black   = (0x00, 0x00, 0x00)
        white   = (0xFF, 0xFF, 0xFF)
        red     = (0xFF, 0x00, 0x00)
        orange  = (0xFF, 0xA5, 0x00)
        yellow  = (0xFF, 0xFF, 0x00)
        green   = (0x00, 0x80, 0x00)
        blue    = (0x00, 0x00, 0xFF)
        purple  = (0x80, 0x00, 0x80)
        pink    = (0xFF, 0x14, 0x93)
        magenta = (0xFF, 0x00, 0xFF)
        cyan    = (0x00, 0xFF, 0xFF)
        lime    = (0x00, 0xFF, 0x00)

gnomeTerminalOpts    = ""
gnomeTerminal        = "gnome-terminal" ++ gnomeTerminalOpts

urxvtOpts            = "+sb -fg white -bg black -fade 70 -fadecolor black"
urxvt                = "rxvt-unicode" ++ urxvtOpts

cmd name ops         = name ++ " " ++ ops

myTerminal           = gnomeTerminal

myFocusFollowsMouse  :: Bool
myFocusFollowsMouse  = False
myBorderWidth        = 2
myModMask            = mod4Mask
myWorkspaces         = ["Main","Dev","Music","Scratch","5","6","7","8","9"]
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#f3993f"
beepOptions = "-l 1000"
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    -- launch dmenu
    --, ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu -b -i -l 20` && eval \"exec $exe\"")
    , ((modm,               xK_p     ), spawn "dmenu_run -i -l 10")
    -- Volume Controls
    , ((0, 0x1008ff12), spawn "amixer -q set Master toggle")
    , ((0, 0x1008ff11), spawn "amixer -q set Master 2- unmute")
    , ((0, 0x1008ff13), spawn "amixer -q set Master 2+ unmute")
    , ((0, 0x1008ff4a), spawn "synclient TouchpadOff=0")
    , ((0, 0x1008ff4b), spawn "synclient TouchpadOff=1")
    , ((0, 0x1008ff03), spawn "sudo bright screen down")
    , ((0, 0x1008ff02), spawn "sudo bright screen up")
    , ((0, 0x1008ff06), spawn "sudo bright keyboard down")
    , ((0, 0x1008ff05), spawn "sudo bright keyboard up")
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- lock the machine
    , ((modm .|. shiftMask, xK_l     ), spawn "slock")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_k     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_j     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapUp  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapDown    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Add Some sounds to the keyboard
    , ((modm .|. controlMask , xK_1           ), spawn $ ("beep -f 261.63"++beepOptions))
    , ((modm .|. controlMask , xK_2           ), spawn $ ("beep -f 277.18"++beepOptions))
    , ((modm .|. controlMask , xK_3           ), spawn $ ("beep -f 293.66"++beepOptions))
    , ((modm .|. controlMask , xK_4           ), spawn $ ("beep -f 311.13"++beepOptions))
    , ((modm .|. controlMask , xK_5           ), spawn $ ("beep -f 329.63"++beepOptions))
    , ((modm .|. controlMask , xK_6           ), spawn $ ("beep -f 349.23"++beepOptions))
    , ((modm .|. controlMask , xK_7           ), spawn $ ("beep -f 369.99"++beepOptions))
    , ((modm .|. controlMask , xK_8           ), spawn $ ("beep -f 392.00"++beepOptions))
    , ((modm .|. controlMask , xK_9           ), spawn $ ("beep -f 415.30"++beepOptions))
    , ((modm .|. controlMask , xK_0           ), spawn $ ("beep -f 440.00"++beepOptions))
    , ((modm .|. controlMask , xK_KP_Subtract ), spawn $ ("beep -f 466.16"++beepOptions))
    , ((modm .|. controlMask , xK_KP_Equal    ), spawn $ ("beep -f 523.25"++beepOptions))


    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function fromv Hooks.DynamicLog.
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Open Grid Select
    , ((modm              , xK_z     ), goToSelected myGsConfig)

    , ((modm .|. shiftMask, xK_z     ), spawnSelected defaultGSConfig ["firefox",
                                                                       "gnome-terminal",
                                                                       "gnome-terminal -e pianobar",
                                                                       "evolution",
                                                                       "gnome-terminal -e screen",
                                                                       "pidgin",
                                                                       "idea.sh",
                                                                       "mosh dev"]) 
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_e, xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w))
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:
myLayout = Full ||| tiled ||| Mirror tiled
-- myLayout = tiled ||| Mirror tiled ||| spiral (6/7) ||| tabbed shrinkText tabTheme
-- myLayout = tabbed shrinkText tabTheme ||| spiral (6/7) ||| Mirror tiled
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 3/5
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100
    -- Tab theme TODO: Fix the shit out of this broken shit
    tabTheme = defaultTheme { 
      activeColor         = purple,
      inactiveColor       = black,
      urgentColor         = yellow,
      activeBorderColor   = cyan,
      inactiveBorderColor = pink,
      urgentBorderColor   = lime,
      activeTextColor     = white,
      inactiveTextColor   = white,
      urgentTextColor     = black
      } where black   = "#000000"
              white   = "#FFFFFF"
              red     = "#FF0001"
              orange  = "#FFA500"
              yellow  = "#FFFF00"
              green   = "#008000"
              blue    = "#0000FF"
              purple  = "#800080"
              pink    = "#FF1493"
              magenta = "#FF00FF"
              cyan    = "#00FFFF"
              lime    = "#00FF00"
------------------------------------------------------------------------
-- Window rules:
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

myEventHook = mempty

myLogHook   = fadeInactiveLogHook 0.5

myStartupHook :: X ()
myStartupHook = setWMName "LG3D" >> do
        spawnOn "Main" myTerminal
        spawnOn "Main" "firefox"
        spawnOn "3:Music" "spotify"
        return ()

main = do
     -- spawnPipe "/home/erik/.cabal/bin/xmobar /home/erik/.xmobarrc"
     xmonad =<< xmobar defaults

defaults = defaultConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask deprecated in 0.9.1
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
      -- hooks, layouts
        layoutHook         = avoidStruts $ myLayout,
        manageHook         = manageDocks <+> myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = (flipToggle startupToggle myStartupHook)
    }
