world state
initForProject: aWorldState
  worldState := aWorldState.
  bounds := (Smalltalk at: #'Display') boundingBox.
  self color: Preferences defaultWorldColor.	"TODO	self addHand: HandMorph new."
  self setProperty: #'automaticPhraseExpansion' toValue: true.
  self
    setProperty: #'optimumExtentFromAuthor'
    toValue: (Smalltalk at: #'Display') extent.
  self wantsMouseOverHalos: Preferences mouseOverHalos.
  self borderWidth: 0.
  model := nil