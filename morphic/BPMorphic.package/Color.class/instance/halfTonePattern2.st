conversions
halfTonePattern2
  "Return a halftone-pattern to approximate luminance levels on 2-bit
	deep Forms."

  | _gsSqueakTemp_lum |
  _gsSqueakTemp_lum := self luminance.
  _gsSqueakTemp_lum < (125 / 1000)
    ifTrue: [ ^ MyBitmap with: 1431655765 ].	"black"
  _gsSqueakTemp_lum < (25 / 100)
    ifTrue: [ ^ MyBitmap with: 1431655765 with: 3722304989 ].	"1/8 gray"
  _gsSqueakTemp_lum < (375 / 1000)
    ifTrue: [ ^ MyBitmap with: 3722304989 with: 2004318071 ].	"2/8 gray"
  _gsSqueakTemp_lum < (5 / 10)
    ifTrue: [ ^ MyBitmap with: 4294967295 with: 2004318071 ].	"3/8 gray"
  _gsSqueakTemp_lum < (625 / 1000)
    ifTrue: [ ^ MyBitmap with: 4294967295 ].	"4/8 gray"
  _gsSqueakTemp_lum < (75 / 100)
    ifTrue: [ ^ MyBitmap with: 4294967295 with: 3149642683 ].	"5/8 gray"
  _gsSqueakTemp_lum < (875 / 1000)
    ifTrue: [ ^ MyBitmap with: 4008636142 with: 3149642683 ].	"6/8 gray"
  _gsSqueakTemp_lum < 1
    ifTrue: [ ^ MyBitmap with: 2863311530 with: 3149642683 ].	"7/8 gray"
  ^ MyBitmap with: 2863311530	"opaque white"	"handy expression for computing patterns for 2x2 tiles;
	set p to a string of 4 letters (e.g., 'wggw' for a gray-and-
	white checkerboard) and print the result of evaluating:
	| p d w1 w2 |
	p := 'wggw'.
	d := Dictionary new.
	d at: $b put: '01'.
	d at: $w put: '10'.
	d at: $g put: '11'.
	w1 := (d at: (p at: 1)), (d at: (p at: 2)).
	w1 := '2r', w1, w1, w1, w1, w1, w1, w1, w1, ' hex'.
	w2 := (d at: (p at: 3)), (d at: (p at: 4)).
	w2 := '2r', w2, w2, w2, w2, w2, w2, w2, w2, ' hex'.
	Array with: (Compiler evaluate: w1) with: (Compiler evaluate: w2)
	"