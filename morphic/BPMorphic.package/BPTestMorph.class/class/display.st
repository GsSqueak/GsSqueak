as yet unclassified
display
  | myMorph |
  (SessionTemps current at: #'Display')
    ifNotNil: [ (SessionTemps current at: #'Display') close ].
  Smalltalk removeKey: #'Sensor' ifAbsent: [  ].
  Smalltalk removeKey: #'Display' ifAbsent: [  ].
  Smalltalk removeKey: #'World' ifAbsent: [  ].
  Smalltalk removeKey: #'ActiveHand' ifAbsent: [  ].
  GraFFIcsLibrary inst initialize.
  SessionTemps current at: #'Sensor' put: EventSensor new.
  SessionTemps current at: #'Display' put: DisplayScreen new.
  (SessionTemps current at: #'Display') setExtent: 640 @ 480 depth: 32.
  1 to: 10000 do: [ :nr | (SessionTemps current at: #'Display') bits byteAt: nr * 4 + 1 put: 255 ].
  (SessionTemps current at: #'Display') offset: 0 @ 0.
  (SessionTemps current at: #'Display') beDisplay.
  SessionTemps current at: #'World' put: nil.
  SessionTemps current
    at: #'World'
    put: (PasteUpMorph new initForProject: AnimWorldState new).
  (SessionTemps current at: #'World') viewBox: (0 @ 0 corner: 640 @ 480).	"Workspace open.	 TextMorph new openInWorld."	"BPTestMorph new openInWorld."
  myMorph := BPTestMorph new.
  myMorph openInWorld.
  [ myMorph wantsToLive ]
    whileTrue: [ (SessionTemps current at: #'World') doOneCycle	"Simulate Animation  Framework" ].
  (SessionTemps current at: #'Display') close.
  Transcript
    show: 'done!';
    cr