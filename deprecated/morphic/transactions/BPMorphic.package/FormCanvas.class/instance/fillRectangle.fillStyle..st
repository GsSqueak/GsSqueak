drawing-rectangles
fillRectangle: aRectangle fillStyle: aFillStyle
  "Fill the given rectangle."

  | _gsSqueakTemp_pattern |
  self shadowColor
    ifNotNil: [ ^ self fillRectangle: aRectangle color: aFillStyle asColor ].
  (aFillStyle isKindOf: InfiniteForm)
    ifTrue: [ ^ self infiniteFillRectangle: aRectangle fillStyle: aFillStyle ].
  aFillStyle isSolidFill
    ifTrue: [ ^ self fillRectangle: aRectangle color: aFillStyle asColor ].	"We have a very special case for filling with infinite forms"
  (aFillStyle isBitmapFill and: [ aFillStyle origin = (0 @ 0) ])
    ifTrue: [ 
      _gsSqueakTemp_pattern := aFillStyle form.
      (aFillStyle direction = (_gsSqueakTemp_pattern width @ 0)
        and: [ aFillStyle normal = (0 @ _gsSqueakTemp_pattern height) ])
        ifTrue: [ 
          "Can use an InfiniteForm"
          ^ self
            fillRectangle: aRectangle
            color: (InfiniteForm with: _gsSqueakTemp_pattern) ] ].	"Use a BalloonCanvas instead"
  super fillRectangle: aRectangle fillStyle: aFillStyle