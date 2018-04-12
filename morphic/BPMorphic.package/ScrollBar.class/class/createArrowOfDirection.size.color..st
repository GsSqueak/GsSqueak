images
createArrowOfDirection: aSymbolDirection size: size color: aColor
  "PRIVATE - create an arrow with aSymbolDirectionDirection,
	finalSizeInteger and aColor 
	aSymbolDirectionDirection = #top, #bottom. #left or #right 
	ScrollBar initializeImagesCache.
	Try with: 
	(ScrollBar createArrowOfDirection: #right size: 14 color: Color
	lightGreen) asMorph openInHand."

  | _gsSqueakTemp_form _gsSqueakTemp_canvas _gsSqueakTemp_vertices _gsSqueakTemp_margin |
  _gsSqueakTemp_form := Form extent: size asPoint depth: 32.
  _gsSqueakTemp_canvas := _gsSqueakTemp_form getCanvas.
  _gsSqueakTemp_margin := size < 14
    ifTrue: [ 2 ]
    ifFalse: [ 3 ].
  _gsSqueakTemp_vertices := {((size // 2) @ _gsSqueakTemp_margin).
  (size asPoint - _gsSqueakTemp_margin asPoint).
  (_gsSqueakTemp_margin @ (size - _gsSqueakTemp_margin)).
  ((size // 2) @ _gsSqueakTemp_margin)}.	"Preferences gradientScrollBars
	ifTrue: [
	fillStyle := GradientFillStyle ramp: {
	0.0 -> (aColor adjustBrightness: 0.5).
	0.1-> (aColor adjustBrightness: 0.05).
	0.6 -> (aColor darker)}.
	fillStyle origin: size // 2 @ margin.
	fillStyle direction: 0 @ size]
	ifFalse: [
	fillStyle := SolidFillStyle color: aColor]."	"_gsSqueakTemp_canvas
		drawPolygon: _gsSqueakTemp_vertices
		fillStyle: (SolidFillStyle color: aColor)."
  ^ _gsSqueakTemp_form clippedToSize: size asPoint	"rotateBy:
      (aSymbolDirection
        caseOf:
          {([ #'top' ] -> [ 0 ]).
          ([ #'bottom' ] -> [ 180 ]).
          ([ #'left' ] -> [ 270 ]).
          ([ #'right' ] -> [ 90 ])})"