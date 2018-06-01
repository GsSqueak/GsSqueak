geometry
resizeScroller
	| inner |
	"used to handle left vs right scrollbar"
	inner := self innerBounds.
	scroller bounds: (inner topLeft + (yScrollBar width@0) corner: (inner bottomRight - (0@xScrollBar height)))