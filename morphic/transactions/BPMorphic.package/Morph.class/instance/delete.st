submorphs-add/remove
delete
  "Remove the receiver as a submorph of its owner and make its 
	new owner be nil."

  | aWorld |
  self removeHalo.
  self isInWorld
    ifTrue: [ 
      self disableSubmorphFocusForHand: self activeHand.
      self activeHand
        releaseKeyboardFocus: self;
        releaseMouseFocus: self ].	"Preserve world reference for player notificaiton. See below."
  aWorld := self world ifNil: [ World ].
  self owner
    ifNotNil: [ 
      self privateDelete.
      self player
        ifNotNil: [ :player | player noteDeletionOf: self fromWorld: aWorld ] ]