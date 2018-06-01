drawing
drawDissolveOn: aCanvas 
	"startForm and endFrom are both fixed, but the dissolve ration
	changes. "
	startForm
		copyBits: endForm
		at: 0 @ 0
		translucent: stepNumber asFloat / (nSteps * 2).
	aCanvas drawImage: startForm at: self position