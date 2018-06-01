accessing
currentImage
	state == #off
		ifTrue: [^ offImage].
	state == #pressed
		ifTrue: [^ pressedImage].
	state == #on
		ifTrue: [^ image].
	^ image