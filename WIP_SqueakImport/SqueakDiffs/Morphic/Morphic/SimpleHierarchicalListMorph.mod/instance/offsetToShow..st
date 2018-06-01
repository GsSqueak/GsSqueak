scrolling
offsetToShow: aRectangle
	"Focus rectangles are too wide and the view hence jumps to the right. Snap it back to 0 on the horizontal axis."
	
	^ 0 @ (super offsetToShow: aRectangle) y