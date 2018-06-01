scrolling
offsetToShow: aRectangle 
	"Due to the approximation of the horizontal scroll range and the
	primary interaction along the vertical axis, we snap back to 0 on the
	horizontal axis."
	^ 0 @ (super offsetToShow: aRectangle) y