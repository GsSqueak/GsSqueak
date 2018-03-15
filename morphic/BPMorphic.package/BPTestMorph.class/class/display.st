as yet unclassified
display
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
  Smalltalk at: #'Sensor' put: EventSensor new.
  Smalltalk at: #'Display' put: DisplayScreen new.
  TextConstants at: #'Tab' put: Character tab.
  LanguageEnvironment clearDefault.
  System commit.
  Display setExtent: 640 @ 480 depth: 32.
  1 to: 10000 do: [ :nr | Display bits byteAt: nr * 4 + 1 put: 255 ].
  Display offset: 0 @ 0.
  Display beDisplay.
  HandMorph initialize.
  StandardScriptingSystem initialize.
  CharacterScanner initialize.
  WorldProvider setWorld: nil.
  Smalltalk at: #'World' put: WorldProvider getWorld.
  WorldState initialize.
  WorldProvider getWorld viewBox: (0 @ 0 corner: 640 @ 480).	"Workspace open."
  Workspace open.
  Display forceToScreen.
  WorldProvider getWorld doOneCycle.
  [ true ] whileTrue: [ World doOneCycle	"Simulate Animation Framework" ]