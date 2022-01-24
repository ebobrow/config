import Data.Char (isSpace)
import qualified Data.Map as M
import XMonad hiding ((|||))
import XMonad.Actions.SpawnOn
import XMonad.Actions.WithAll (killAll)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.Shell (shellPrompt)
import qualified XMonad.StackSet as W
import XMonad.Util.Cursor
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run

myTerminal = "kitty"

myWorkspaces = map show [1 .. 9]

myModMask = mod4Mask

myManageHook =
  composeAll
    [ resource =? "desktop_window" --> doIgnore,
      className =? "Gimp" --> doFloat,
      className =? "Download" --> doFloat,
      className =? "Progress" --> doFloat,
      isFullscreen --> doFullFloat,
      className =? "qutebrowser" --> doShift "2"
    ]

myLayoutHook = onWorkspace "2" tabs tall
  where
    tabs = maximizeWithPadding 0 $ noBorders $ avoidStruts $ tabbed shrinkText myTabTheme
    tall = maximizeWithPadding 0 $ avoidStruts $ smartBorders $ Tall 1 (3 / 100) (1 / 2)

myTabTheme =
  def
    { fontName = "xft:FiraCode Nerd Font:size=9",
      activeColor = myFocusedBorderColor,
      inactiveColor = "#282C34",
      activeBorderColor = myFocusedBorderColor,
      inactiveBorderColor = "#282c34",
      activeTextColor = "#282c34",
      inactiveTextColor = "#ABB2BF"
    }

myXPConfig =
  def
    { font = "xft:FiraCode Nerd Font:size=9",
      bgColor = "#32302f",
      fgColor = "#d0d0d0",
      bgHLight = "#c792ea",
      fgHLight = "#000000",
      borderColor = "#282c34",
      promptBorderWidth = 1,
      position = Top,
      height = 20,
      historySize = 256,
      historyFilter = id,
      defaultText = [],
      autoComplete = Just 100000,
      showCompletionOnTab = True,
      alwaysHighlight = True,
      maxComplRows = Nothing
    }

myNormalBorderColor = "black"
myFocusedBorderColor = "#56B6C2"
myBorderWidth = 1

calcPrompt c ans =
  inputPrompt c (trim ans) ?+ \input ->
    liftIO
      (runProcessWithInput "qalc" [input] "")
      >>= calcPrompt c
  where
    trim = f . f
      where
        f = reverse . dropWhile isSpace

myKeys =
  [ ("M-<Return>", spawn myTerminal),
    ("M-w", kill),
    ("M-S-w", killAll),
    ("M-f", withFocused (sendMessage . maximizeRestore)),
    -- Programs
    ("M-b", spawn "qutebrowser"),
    ("M-r q", calcPrompt myXPConfig "qalc"),
    ("M-p", shellPrompt myXPConfig),
    ("M-S-<Return>", spawn "kitty -e mux"),
    ("M-s", spawn "scrot 'scrots/%Y-%m-%d_%I:%M:%S_$wx$h.png'"),
    ("M-S-s", spawn "sxiv scrots")
  ]

myFocusFollowsMouse = False

myMouseBindings XConfig {XMonad.modMask = modMask} =
  M.fromList
    [ -- mod-button1, Set the window to floating mode and move by dragging
      ((modMask, button1), \w -> focus w >> mouseMoveWindow w),
      -- mod-button2, Raise the window to the top of the stack
      ((modMask, button2), \w -> focus w >> windows W.swapMaster),
      -- mod-button3, Set the window to floating mode and resize by dragging
      ((modMask, button3), \w -> focus w >> mouseResizeWindow w)
    ]

myStartupHook = do
  setDefaultCursor xC_left_ptr
  spawnOn "1" "kitty -e mux"
  spawnOn "2" "qutebrowser"

main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.conf"
  xmonad $
    docks
      def
        { manageHook = myManageHook <+> manageDocks,
          layoutHook = myLayoutHook,
          startupHook = myStartupHook,
          terminal = myTerminal,
          focusFollowsMouse = myFocusFollowsMouse,
          borderWidth = myBorderWidth,
          modMask = myModMask,
          workspaces = myWorkspaces,
          normalBorderColor = myNormalBorderColor,
          focusedBorderColor = myFocusedBorderColor,
          mouseBindings = myMouseBindings,
          logHook =
            dynamicLogWithPP
              xmobarPP
                { ppOutput = hPutStrLn xmproc,
                  ppTitle = xmobarColor myFocusedBorderColor "" . shorten 200,
                  ppCurrent = xmobarColor myFocusedBorderColor "" . wrap "" "",
                  ppHidden = xmobarColor "#ABB2BF" "" . noScratchPad,
                  ppSep = xmobarColor "#928374" "" " | ",
                  ppUrgent = xmobarColor "#ff69b4" "",
                  ppLayout = const ""
                }
        }
      `additionalKeysP` myKeys
  where
    noScratchPad ws = if ws == "NSP" then "" else ws
