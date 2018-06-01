private
addHandlesForWorldHalos
  "Add handles for world halos, like the man said"

  | _gsSqueakTemp_box _gsSqueakTemp_w |
  _gsSqueakTemp_w := self world ifNil: [ target world ].
  self removeAllMorphs.	"remove old handles, if any"
  self bounds: target bounds.
  _gsSqueakTemp_box := _gsSqueakTemp_w bounds insetBy: 9.
  target addWorldHandlesTo: self box: _gsSqueakTemp_box.
  Preferences uniqueNamesInHalos
    ifTrue: [ innerTarget assureExternalName ].
  self
    addNameBeneath: (_gsSqueakTemp_box insetBy: (0 @ 0 corner: 0 @ 10))
    string: innerTarget externalName.
  growingOrRotating := false.
  self layoutChanged.
  self changed