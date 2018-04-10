drawing
drawOn: aCanvas
  "Draw this morph only if it has no target."

  (Preferences showBoundsInHalo and: [ self target isWorldMorph not ])
    ifTrue: [ 
      | boundsColor |
      boundsColor := Color blue.
      aCanvas
        frameAndFillRectangle: self bounds
        fillColor: Color transparent
        borderWidth: 2
        borderColor: boundsColor ]