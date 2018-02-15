private
addCircleHandles
  | _gsSqueakTemp_box |
  simpleMode := false.
  target isWorldMorph
    ifTrue: [ ^ self addHandlesForWorldHalos ].
  self removeAllMorphs.	"remove old handles, if any"
  self bounds: target renderedMorph worldBoundsForHalo.	"update my size"
  _gsSqueakTemp_box := self basicBox.
  target addHandlesTo: self box: _gsSqueakTemp_box.	"self addName."	"TODO HACK font missing"
  growingOrRotating := false.
  self layoutChanged.
  self changed