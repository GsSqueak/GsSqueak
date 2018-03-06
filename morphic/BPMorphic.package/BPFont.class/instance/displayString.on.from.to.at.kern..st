as yet unclassified
displayString: aString on: aDisplayContext from: startIndex to: stopIndex at: aPoint kern: kernDelta
  | charCode destForm |
  "1 to: aString size do: [ :index | 
    charCode := (aString at: index) asInteger aDisplayContext
      sourceRect: (Rectangle origin: charCode @ 0 extent: 8 @ 16);
      destRect: (Rectangle origin: (aPoint x + (index * 8)) @ aPoint y).
    aDisplayContext sourceForm: form.
    aDisplayContext combinationRule: 3.
    aDisplayContext copyBits ]"
  GraFFIcsLibrary displayString: aString at: aPoint on: aDisplayContext destForm