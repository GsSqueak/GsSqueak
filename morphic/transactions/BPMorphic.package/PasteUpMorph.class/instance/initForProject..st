world state
initForProject: aWorldState
  worldState := aWorldState.
  bounds := (SessionTemps current at: #'Display') boundingBox.
  self color: Preferences defaultWorldColor.
  self addHand: HandMorph new.
  self setProperty: #'automaticPhraseExpansion' toValue: true.
  self
    setProperty: #'optimumExtentFromAuthor'
    toValue: (SessionTemps current at: #'Display') extent.
  self wantsMouseOverHalos: Preferences mouseOverHalos.
  self borderWidth: 0.
  model := nil