event handling
processMouseOver: anEvent
  "Re-establish the z-order for all morphs wrt the given event"

  | _gsSqueakTemp_hand _gsSqueakTemp_localEvt _gsSqueakTemp_focus _gsSqueakTemp_evt |
  anEvent ifNil: [ ^ self ].
  _gsSqueakTemp_hand := anEvent hand.
  leftMorphs := mouseOverMorphs asIdentitySet.	"Assume some coherence for the number of objects in over list"
  overMorphs := WriteStream on: (Array new: leftMorphs size).
  enteredMorphs := WriteStream on: Array new.	"Now go looking for eventual mouse overs"
  _gsSqueakTemp_hand handleEvent: anEvent asMouseOver.	"Get out early if there's no change"
  (leftMorphs isEmpty and: [ enteredMorphs position = 0 ])
    ifTrue: [ ^ self initializeTrackedMorphs ].
  _gsSqueakTemp_focus := _gsSqueakTemp_hand mouseFocus.	"Send #mouseLeave as appropriate"
  _gsSqueakTemp_evt := anEvent asMouseLeave.	"Keep the order of the left morphs by recreating it from the
	mouseOverMorphs "
  leftMorphs size > 1
    ifTrue: [ leftMorphs := mouseOverMorphs select: [ :m | leftMorphs includes: m ] ].
  leftMorphs
    do: [ :m | 
      (m == _gsSqueakTemp_focus or: [ m hasOwner: _gsSqueakTemp_focus ])
        ifTrue: [ 
          _gsSqueakTemp_localEvt := _gsSqueakTemp_evt
            transformedBy: (m transformedFrom: _gsSqueakTemp_hand).
          m handleEvent: _gsSqueakTemp_localEvt ]
        ifFalse: [ overMorphs nextPut: m ] ].
  enteredMorphs
    ifNil: [ 
      "inform: was called in handleEvent:"
      ^ self initializeTrackedMorphs ].	"Send #mouseEnter as appropriate"
  _gsSqueakTemp_evt := anEvent asMouseEnter.
  enteredMorphs contents
    reverseDo: [ :m | 
      (m == _gsSqueakTemp_focus or: [ m hasOwner: _gsSqueakTemp_focus ])
        ifTrue: [ 
          _gsSqueakTemp_localEvt := _gsSqueakTemp_evt
            transformedBy: (m transformedFrom: _gsSqueakTemp_hand).
          m handleEvent: _gsSqueakTemp_localEvt ] ].	"And remember the over list"
  overMorphs ifNotNil: [ mouseOverMorphs := overMorphs contents ].
  self initializeTrackedMorphs