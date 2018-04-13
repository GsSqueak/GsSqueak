as yet unclassified
createWindow: aPoint
  ^ createWindowCo
    callWith:
      {(aPoint x).
      (aPoint y)}