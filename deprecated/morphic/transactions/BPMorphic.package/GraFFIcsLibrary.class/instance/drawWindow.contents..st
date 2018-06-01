as yet unclassified
drawWindow: aWindow contents: aBitmap
  DrawWindowCo
    callWith:
      {(aWindow cPointer).
      (aBitmap cArray)}