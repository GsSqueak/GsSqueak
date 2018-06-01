stepping and presenter
step
	(flash or: [flashing])
		ifTrue: 
			[flashing := flashing not.
			self highlighted: flashing].
	scroller ifNil: [scroller := 1].
	chars ifNil: [^ self].
	scroller + chars < (string size + 1)
		ifTrue: 
			[scroller := scroller + 1.
			self stringToLed]
		ifFalse: [scrollLoop ifTrue: [scroller := 1]]