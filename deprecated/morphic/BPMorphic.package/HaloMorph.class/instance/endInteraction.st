private
endInteraction
  "Clean up after a user interaction with the a halo control"

  | _gsSqueakTemp_m |
  self isMagicHalo: false.	"no longer"
  self magicAlpha: 1.
  0.
  (target isInWorld not or: [ owner isNil ])
    ifTrue: [ ^ self ].
  [ target isFlexMorph and: [ target hasNoScaleOrRotation ] ]
    whileTrue: [ 
      _gsSqueakTemp_m := target firstSubmorph.
      target removeFlexShell.
      target := _gsSqueakTemp_m ].
  self isInWorld
    ifTrue: [ 
      "make sure handles show in front, even if flex shell added"
      self comeToFront.
      self addHandles ].
  (self valueOfProperty: #'commandInProgress')
    ifNotNil: [ :cmd | 
      "			self rememberCommand: cmd."
      "TODO HACK"
      self removeProperty: #'commandInProgress' ]