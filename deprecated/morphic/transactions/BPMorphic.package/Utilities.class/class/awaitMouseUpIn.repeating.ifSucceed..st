miscellaneous
awaitMouseUpIn: box repeating: doBlock ifSucceed: succBlock 
	"The mouse has gone down in box; track the mouse, inverting the box
	while it's within, and if, on mouse up, the cursor was still within the
	box, execute succBlock. While waiting for the mouse to come up,
	repeatedly execute doBlock. 5/11/96 sw
	6/10/96 sw: call new method that adds extra feature"
	^ self
		awaitMouseUpIn: box
		whileMouseDownDo: doBlock
		whileMouseDownInsideDo: []
		ifSucceed: succBlock