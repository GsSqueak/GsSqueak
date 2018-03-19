conversions
halfTonePattern1
  "Return a halftone-pattern to approximate luminance levels on 1-bit
	deep Forms."

  | _gsSqueakTemp_lum |
  _gsSqueakTemp_lum := self luminance.
  _gsSqueakTemp_lum < (1 / 10)
    ifTrue: [ ^ Bitmap with: 4294967295 ].	"black"
  _gsSqueakTemp_lum < (4 / 10)
    ifTrue: [ ^ Bitmap with: 3149642683 with: 4008636142 ].	"dark gray"
  _gsSqueakTemp_lum < (6 / 10)
    ifTrue: [ ^ Bitmap with: 1431655765 with: 2863311530 ].	"medium gray"
  _gsSqueakTemp_lum < (9 / 10)
    ifTrue: [ ^ Bitmap with: 1145324612 with: 286331153 ].	"light gray"
  ^ Bitmap with: 0	"1-bit white"