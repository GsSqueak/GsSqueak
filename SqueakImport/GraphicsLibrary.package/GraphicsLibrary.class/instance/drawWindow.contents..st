as yet unclassified
drawWindow: aWindow contents: aBitmap
  drawWindowCo
    _env0 callWith:
      {aWindow.
      (aBitmap cArray)}
