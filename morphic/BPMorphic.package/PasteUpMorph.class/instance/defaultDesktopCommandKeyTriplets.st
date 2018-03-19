world menu
defaultDesktopCommandKeyTriplets
  "Answer a list of triplets of the form
		<key> <receiver> <selector>   [+ optional fourth element, a <description> for use in desktop-command-key-help]
that will provide the default desktop command key handlers.  If the selector takes an argument, that argument will be the command-key event"

  | noviceKeys expertKeys |
  noviceKeys := {{$o.
  (Smalltalk at: #'ActiveWorld').
  #'activateObjectsTool'.
  'Activate the "Objects Tool"'}.
  {$r.
  (Smalltalk at: #'ActiveWorld').
  #'restoreMorphicDisplay'.
  'Redraw the screen'}.
  {$z.
  self.
  #'undoOrRedoCommand'.
  'Undo or redo the last undoable command'}.
  {$F.	"(Project current)"
  nil.
  #'toggleFlapsSuppressed'.
  'Toggle the display of flaps'}.
  {$N.
  self.
  #'toggleClassicNavigatorIfAppropriate'.
  'Show/Hide the classic Navigator, if appropriate'}.
  {$M.
  self.
  #'toggleShowWorldMainDockingBar'.
  'Show/Hide the Main Docking Bar'}.
  {$].
  Smalltalk.
  #'saveSession'.
  'Save the image.'}}.
  Preferences noviceMode
    ifTrue: [ ^ noviceKeys ].
  expertKeys := {{$b.	"SystemBrowser"
  nil.
  #'defaultOpenBrowser'.
  'Open a new System Browser'}.
  {$k.
  StringHolder.
  #'open'.
  'Open a new, blank Workspace'}.
  {$m.
  self.
  #'putUpNewMorphMenu'.
  'Put up the "New Morph" menu'}.
  {$O.
  self.
  #'findAMonticelloBrowser'.
  'Bring a Monticello window into focus.'}.
  {$t.
  self.
  #'findATranscript:'.
  'Make a System Transcript visible'}.
  {$w.
  SystemWindow.
  #'closeTopWindow'.
  'Close the topmost window'}.
  {(Character escape).
  SystemWindow.
  #'closeTopWindow'.
  'Close the topmost window'}.
  {$C.
  self.
  #'findAChangeSorter:'.
  'Make a Change Sorter visible'}.
  {$L.
  self.
  #'findAFileList:'.
  'Make a File List visible'}.
  {$P.
  self.
  #'findAPreferencesPanel:'.
  'Activate the Preferences tool'}.
  {$R.
  Utilities.
  #'browseRecentSubmissions'.
  'Make a Recent Submissions browser visible'}.
  {$W.
  self.
  #'findAMessageNamesWindow:'.
  'Make a MessageNames tool visible'}.
  {$Z.
  ChangeList.
  #'browseRecentLog'.
  'Browse recently-logged changes'}.
  {$\.
  SystemWindow.
  #'sendTopWindowToBack'.
  'Send the top window to the back'}.
  {$_.
  Smalltalk.
  #'quitPrimitive'.
  'Quit the image immediately.'}}.
  ^ noviceKeys , expertKeys