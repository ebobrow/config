import Data.Char (isSpace)
import qualified Data.Map as M
import System.Exit
import System.IO
import XMonad hiding ((|||))
import XMonad.Actions.CycleRecentWS
import XMonad.Actions.Minimize
import XMonad.Actions.WithAll (killAll)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Accordion
import XMonad.Layout.BoringWindows hiding (Replace)
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.Tabbed
import XMonad.Layout.WindowNavigation
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.Shell (shellPrompt)
import qualified XMonad.StackSet as W
import XMonad.Util.Cursor
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run

myTerminal = "st"

myWorkspaces = map show [1 .. 9]

myModMask = mod4Mask

myManageHook =
  composeAll
    [ resource =? "desktop_window" --> doIgnore,
      className =? "Gimp" --> doFloat,
      className =? "Download" --> doFloat,
      className =? "Progress" --> doFloat,
      isFullscreen --> doFullFloat
    ]
    <+> namedScratchpadManageHook myScratchpads

myLayoutHook = boringWindows $ maximizeWithPadding 0 $ minimize (flex ||| tabs)
  where
    mySpacing i = spacingRaw False (Border i i i i) False (Border i i i i) True
    flex =
      renamed [Replace "Flex"] $
        avoidStruts $
          smartBorders $
            configurableNavigation noNavigateBorders $
              addTabs shrinkText myTabTheme $
                subLayout [] (Simplest ||| Accordion) $
                  mySpacing 4 $
                    ResizableTall 1 (1 / 20) (1 / 2) []
    tabs =
      renamed [Replace "Tabs"] $
        noBorders $
          avoidStruts $
            tabbed shrinkText myTabTheme

myTabTheme =
  def
    { fontName = "xft:mononoki Nerd Font:size=9",
      activeColor = myFocusedBorderColor,
      inactiveColor = "#313846",
      -- inactiveColor = "#32302f",
      activeBorderColor = myFocusedBorderColor,
      inactiveBorderColor = "#282c34",
      activeTextColor = "#282c34",
      inactiveTextColor = "#d0d0d0"
    }

myNormalBorderColor = "black"

-- myFocusedBorderColor = "#83a598"
-- myFocusedBorderColor = "#689d6a"
myFocusedBorderColor = "#56B6C2"

-- Width of the window border in pixels.
myBorderWidth = 1

myXPConfig =
  def
    { font = "xft:mononoki Nerd Font:size=9",
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
    --, ("M-S-<Return>", spawn "dmenu_run")
    ("M-w", kill),
    ("M-S-w", killAll),
    ("M-<Tab>", sendMessage NextLayout),
    ( "M-x",
      sequence_ [sendMessage ToggleStruts, toggleWindowSpacingEnabled]
    ),
    ("M-s t", namedScratchpadAction myScratchpads "terminal"),
    ("M-M1-<Tab>", cycleRecentWS [xK_Alt_L] xK_Tab xK_grave),
    ("M-f", withFocused (sendMessage . maximizeRestore)),
    ("M-m", withFocused minimizeWindow),
    ("M-S-m", withLastMinimized maximizeWindowAndFocus),
    ("M-j", focusDown),
    ("M-k", focusUp),
    ("M-g", withFocused (sendMessage . UnMerge)),
    ("M-S-j", windows W.swapDown),
    ("M-S-k", windows W.swapUp),
    ("M-h", sendMessage Shrink),
    ("M-l", sendMessage Expand),
    ("M-S-h", sendMessage MirrorShrink),
    ("M-S-l", sendMessage MirrorExpand),
    ("M-C-j", sendMessage $ pullGroup D),
    ("M-C-k", sendMessage $ pullGroup U),
    ("M-C-h", sendMessage $ pullGroup L),
    ("M-C-l", sendMessage $ pullGroup R),
    ("M-t", withFocused $ windows . W.sink),
    ("M-,", sendMessage (IncMasterN 1)),
    ("M-.", sendMessage (IncMasterN (-1))),
    ("M-S-q", io exitSuccess),
    ("M-q", restart "xmonad" True),
    ("M-S-.", incWindowSpacing 4),
    ("M-S-,", decWindowSpacing 4),
    ("M-;", onGroup W.focusUp'),
    ("M-'", onGroup W.focusDown'),
    -- Programs
    ("M-b", spawn "qutebrowser"),
    ("M-r x", spawn "signout"),
    ("M-r a", spawn "alarm"),
    ("M-r e", spawn "dmenuunicode"),
    ("M-r q", calcPrompt myXPConfig "qalc"),
    ("M-r w", spawn "networkmanager_dmenu"),
    ("M-s w", spawn "sxiv -t ~/wallpapers"),
    ("M-p", shellPrompt myXPConfig),
    ("M-S-<Return>", spawn "st -e mux")
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

-- you may also bind events to the mouse scroll wheel (button4 and button5)
myStartupHook = do
  setDefaultCursor xC_left_ptr

myScratchpads = [NS "terminal" spawnTerm findTerm manageTerm]
  where
    spawnTerm = "st -n scratchpad"
    findTerm = resource =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
      where
        h = 0.9
        w = 0.9
        t = 0.95 - h
        l = 0.95 - w

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
