as yet unclassified
createWindow: aRectangle
  ^ CreateWindowCo
    callWith:
      {(aRectangle left).
      (aRectangle top).
      (aRectangle width).
      (aRectangle height)}