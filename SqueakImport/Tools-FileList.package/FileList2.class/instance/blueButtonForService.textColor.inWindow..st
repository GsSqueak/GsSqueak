user interface
blueButtonForService: aService textColor: textColor inWindow: window 
	| block result |
	block := [self fullName isNil
				ifTrue: [self inform: 'Please select a file' translated]
				ifFalse: [aService performServiceFor: self]].
	result := window
				fancyText: aService buttonLabel capitalized translated
				font: Preferences standardEToysFont
				color: textColor.
	result setProperty: #buttonText toValue: aService buttonLabel capitalized;
		 hResizing: #rigid;
		 extent: 100 @ 20;
		 layoutInset: 4;
		 borderWidth: 1;
		 useRoundedCorners;
		 setBalloonText: aService label.
	result
		on: #mouseUp
		send: #value
		to: block.
	^ result