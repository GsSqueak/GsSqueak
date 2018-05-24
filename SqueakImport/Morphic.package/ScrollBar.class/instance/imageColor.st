accessing
imageColor

	^ slider ifNil: [Color black] ifNotNil: [:s | 
		(s color = s borderColor or: [s borderColor isTransparent])
			ifTrue: [s color adjustBrightness: (s color brightness < 0.5 ifTrue: [0.2] ifFalse: [-0.2])]
			ifFalse: [s borderColor]]