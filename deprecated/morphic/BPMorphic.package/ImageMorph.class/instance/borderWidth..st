accessing
borderWidth: bw
  | _gsSqueakTemp_newExtent |
  _gsSqueakTemp_newExtent := (2 * bw + image extent x) @ image extent y.
  bounds extent = _gsSqueakTemp_newExtent
    ifFalse: [ super extent: _gsSqueakTemp_newExtent ].
  super borderWidth: bw