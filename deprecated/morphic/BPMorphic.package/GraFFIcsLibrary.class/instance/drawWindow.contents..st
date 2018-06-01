as yet unclassified
drawWindow: aWindow contents: aBitmap
  drawWindowCo
    callWith:
      {aWindow.
      (aBitmap cArray)}