-Etoys-geometry
goHome
  | _gsSqueakTemp_box _gsSqueakTemp_fb |
  self owner isInMemory
    ifFalse: [ ^ self ].
  self owner isNil
    ifTrue: [ ^ self ].
  self visible
    ifFalse: [ ^ self ].
  _gsSqueakTemp_box := self owner visibleClearArea.
  _gsSqueakTemp_fb := self fullBounds.
  _gsSqueakTemp_fb left < _gsSqueakTemp_box left
    ifTrue: [ self left: _gsSqueakTemp_box left - _gsSqueakTemp_fb left + self left ].
  _gsSqueakTemp_fb right > _gsSqueakTemp_box right
    ifTrue: [ self right: _gsSqueakTemp_box right - _gsSqueakTemp_fb right + self right ].
  _gsSqueakTemp_fb top < _gsSqueakTemp_box top
    ifTrue: [ self top: _gsSqueakTemp_box top - _gsSqueakTemp_fb top + self top ].
  _gsSqueakTemp_fb bottom > _gsSqueakTemp_box bottom
    ifTrue: [ self bottom: _gsSqueakTemp_box bottom - _gsSqueakTemp_fb bottom + self bottom ]