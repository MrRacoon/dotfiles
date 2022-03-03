import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Config.Mate

import XMonad.Layout.Fullscreen
import XMonad.Layout.Circle
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing

import XMonad.Actions.FindEmptyWorkspace
import XMonad.Actions.NoBorders

import XMonad.Actions.SpawnOn

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import Data.List

import Data.Monoid
import System.Exit

import XMonad.Config.Mate

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

black   = "#000000"
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

myModMask            = mod4Mask -- Super key

myTerminal           = gnomeTerminal

gnomeTerminalOpts    = ""
gnomeTerminal        = "gnome-terminal" ++ gnomeTerminalOpts

urxvtOpts            = "+sb -fg white -bg black -fade 70 -fadecolor black"
urxvt                = "rxvt-unicode" ++ urxvtOpts

myBorderWidth        = 3
myBorderSpace        = 1
myNormalBorderColor  = white
myFocusedBorderColor = magenta

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    -- launch dmenu
    , ((modm,               xK_p     ), spawn "rofi -show run")

    -- launch screenshotter
    , ((modm,               xK_s), spawn "scrot 'Pictures/scrot_%Y-%m-%d_%s.png' -e 'eog $f'")
    , ((modm .|. shiftMask, xK_s), spawn "sleep 0.2; scrot 'Pictures/scrot_%Y-%m-%d_%s.png' -s -e 'eog $f'")

    -- Volume Controls
    -- , ((0, 0x1008ff12), spawn "amixer -q set Master toggle")
    -- , ((0, 0x1008ff11), spawn "amixer -q set Master 2- unmute")
    -- , ((0, 0x1008ff13), spawn "amixer -q set Master 2+ unmute")
    -- , ((0, 0x1008ff4a), spawn "synclient TouchpadOff=0")
    -- , ((0, 0x1008ff4b), spawn "synclient TouchpadOff=1")
    -- , ((0, 0x1008ff03), spawn "sudo bright screen down")
    -- , ((0, 0x1008ff02), spawn "sudo bright screen up")
    -- , ((0, 0x1008ff06), spawn "sudo bright keyboard down")
    -- , ((0, 0x1008ff05), spawn "sudo bright keyboard up")

    -- lock the machine
    , ((modm .|. shiftMask, xK_l     ), spawn "slock")

    -- Convert to colmak
    -- , ((modm,               xK_minus ), spawn "setxkbmap us")

    -- Convert to qwerty
    -- , ((modm,               xK_equal), spawn "setxkbmap us -variant colemak")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_k     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_j     ), windows W.focusUp  )

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

    -- interface with lifx
    -- Add commands to turn my bulbs different color
    , ((modm .|. controlMask , xK_0           ), spawn "lifx -0")
    , ((modm .|. controlMask , xK_1           ), spawn "lifx -1")
    , ((modm .|. controlMask , xK_2           ), spawn "lifx -c red")
    , ((modm .|. controlMask , xK_3           ), spawn "lifx -C orange")
    , ((modm .|. controlMask , xK_4           ), spawn "lifx -C yellow")
    , ((modm .|. controlMask , xK_5           ), spawn "lifx -C green")
    , ((modm .|. controlMask , xK_6           ), spawn "lifx -C cyan")
    , ((modm .|. controlMask , xK_7           ), spawn "lifx -C blue")
    , ((modm .|. controlMask , xK_8           ), spawn "lifx -C magenta")
    , ((modm .|. controlMask , xK_9           ), spawn "lifx -C white")

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function fromv Hooks.DynamicLog.
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_y     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_y     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]
    ++
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_e, xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]


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
myLayout = smartSpacing myBorderSpace (Full ||| tiled ||| Mirror tiled)
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
      } where 
------------------------------------------------------------------------
-- Window rules:
myStartupHook :: X ()
myStartupHook = setWMName "LG3D" >> do
        spawnOn "1"  myTerminal
        spawnOn "1" "google-chrome-stable"
        spawnOn "1" "spotify"
        spawnOn "1" "slack"
        return ()

defaults = mateConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = True,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask deprecated in 0.9.1
        -- numlockMask        = myNumlockMask,
        workspaces         = ["1","2","3","4","5","6","7","8","9"],
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
      -- hooks, layouts
        layoutHook         = avoidStruts $ myLayout,
        manageHook         = manageDocks <+> mempty,
        handleEventHook    = mempty,
        logHook            = mempty,
        startupHook        = myStartupHook
    }

main = do
    xmonad =<< xmobar defaults

