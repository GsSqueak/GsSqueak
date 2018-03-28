as yet unclassified
initialize
  EventSensorConstants initialize.
  IdentityTransform initialize.
  EventSensor initialize.
  BitBlt initialize.
  BitBltSimulator initialize.
  BitBltSimulation initialize.
  Smalltalk at: #'DefaultTextStyle' put: TextStyle new.
  (Smalltalk at: #'DefaultTextStyle') firstIndent: 0.
  (Smalltalk at: #'DefaultTextStyle') restIndent: 0.
  (Smalltalk at: #'DefaultTextStyle') rightIndent: 0.
  (Smalltalk at: #'DefaultTextStyle') lineGrid: 16.
  HandMorph initialize.
  TextMorph initialize.
  ImageMorph initialize.
  SmalltalkEditor initialize.
  StandardScriptingSystem initialize.
  ScriptingSystem initializeSmallHaloIcons.
  CharacterScanner initialize.
  WorldState initialize.
  Cursor startUp