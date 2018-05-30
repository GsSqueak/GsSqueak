stepping and presenter
step
	| d form |
	images isEmpty ifTrue: [^ self].
		
	nextTime > Time millisecondClockValue
		ifTrue: [^self].
"	self changed."
	imageIndex > 0 ifTrue: [
		form := images at: imageIndex.
		form displayOn: self image at: 0@0 rule: (self isOpaque ifTrue: [Form paint] ifFalse: [Form erase])].
	form := images at: (imageIndex := imageIndex \\ images size + 1).
	form displayOn: self image at: 0@0 rule: Form paint.
	self changed. 
	d := (delays at: imageIndex) ifNil: [0].
	nextTime := Time millisecondClockValue + d
