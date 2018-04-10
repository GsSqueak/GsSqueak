-Etoys-geometry
referencePositionInWorld: aPoint
  | _gsSqueakTemp_localPosition |
  _gsSqueakTemp_localPosition := self owner
    ifNil: [ aPoint ]
    ifNotNil: [ (self owner transformFrom: self world) globalPointToLocal: aPoint ].
  self referencePosition: _gsSqueakTemp_localPosition