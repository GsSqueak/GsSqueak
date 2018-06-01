slot-kedama
newTurtleSilently
  | _gsSqueakTemp_m |
  _gsSqueakTemp_m := KedamaTurtleMorph new openInWorld.
  self useTurtle: _gsSqueakTemp_m player.
  _gsSqueakTemp_m turtleCount: 0.
  _gsSqueakTemp_m
    setNameTo:
      ((SessionTemps current at: #'ActiveWorld')
        unusedMorphNameLike: _gsSqueakTemp_m innocuousName).
  ^ _gsSqueakTemp_m