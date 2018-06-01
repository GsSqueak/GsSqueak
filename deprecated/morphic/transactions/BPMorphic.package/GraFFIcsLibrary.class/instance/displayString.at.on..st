as yet unclassified
displayString: aString at: aPoint on: aForm
  DisplayStringCo
    callWith:
      {aString.
      (aPoint x).
      (aPoint y).
      (aForm bits cArray).
      (aForm width).
      (aForm height)}