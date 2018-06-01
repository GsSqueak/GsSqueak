slot-kedama
newPatch
  | _gsSqueakTemp_f |
  _gsSqueakTemp_f := KedamaPatchMorph
    newExtent: self costume renderedMorph dimensions.
  _gsSqueakTemp_f assuredPlayer assureUniClass.
  _gsSqueakTemp_f
    setNameTo:
      ((SessionTemps current at: #'ActiveWorld')
        unusedMorphNameLike: _gsSqueakTemp_f innocuousName).
  self createSlotForPatch: _gsSqueakTemp_f.
  self addToPatchDisplayList: _gsSqueakTemp_f assuredPlayer.
  self costume world primaryHand attachMorph: _gsSqueakTemp_f.
  ^ _gsSqueakTemp_f