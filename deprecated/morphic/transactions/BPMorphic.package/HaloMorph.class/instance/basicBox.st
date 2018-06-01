private
basicBox
  | _gsSqueakTemp_aBox _gsSqueakTemp_minSide _gsSqueakTemp_anExtent _gsSqueakTemp_w |
  _gsSqueakTemp_minSide := 4 * self handleSize.
  _gsSqueakTemp_anExtent := (self width + self handleSize + 8
    max: _gsSqueakTemp_minSide)
    @ (self height + self handleSize + 8 max: _gsSqueakTemp_minSide).
  _gsSqueakTemp_aBox := Rectangle
    center: self center
    extent: _gsSqueakTemp_anExtent.
  _gsSqueakTemp_w := self world ifNil: [ target outermostWorldMorph ].
  ^ _gsSqueakTemp_w
    ifNil: [ _gsSqueakTemp_aBox ]
    ifNotNil: [ _gsSqueakTemp_aBox intersect: (_gsSqueakTemp_w viewBox insetBy: 8 @ 8) ]