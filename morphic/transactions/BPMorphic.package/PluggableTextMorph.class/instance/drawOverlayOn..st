drawing
drawOverlayOn: aCanvas
  "Draw frame adornments on top of everything otherwise they will
	partially overlap with text selection which looks ugly."

  self drawWrapBorderOn: aCanvas.
  super drawOverlayOn: aCanvas	"self drawFrameAdornmentsOn: aCanvas"