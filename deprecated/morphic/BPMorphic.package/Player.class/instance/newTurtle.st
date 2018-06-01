slot-kedama
newTurtle
  | _gsSqueakTemp_m |
  _gsSqueakTemp_m := KedamaTurtleMorph new openInWorld.
  self costume hasNoTurtleBreed
    ifTrue: [ _gsSqueakTemp_m color: Color red ].
  self useTurtle: _gsSqueakTemp_m player.
  _gsSqueakTemp_m
    setNameTo:
      ((SessionTemps current at: #'ActiveWorld')
        unusedMorphNameLike: _gsSqueakTemp_m innocuousName).
  self costume world primaryHand attachMorph: _gsSqueakTemp_m.
  ^ _gsSqueakTemp_m