show & hide
showFlapIfHandLaden: evt 
	"The hand has drifted over the receiver with the button down. If the
	hand is carrying anything, show the flap. If the hand is empty, the
	likely cause is that it's manipulating a scrollbar or some such, so in
	that case don't pop the flap out."
	evt hand hasSubmorphs
		ifTrue: [self showFlap]