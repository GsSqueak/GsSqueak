blue ui
blueButtonText: aString textColor: textColor color: aColor inWindow: window 
	| result |
	result := window
				fancyText: aString translated
				font: Preferences standardEToysFont
				color: textColor.
	result setProperty: #buttonText toValue: aString;
		 hResizing: #rigid;
		 extent: 100 @ 20;
		 layoutInset: 4;
		 borderWidth: 1;
		 useRoundedCorners.
	aColor isNil
		ifFalse: [""result color: aColor. result borderColor: aColor muchDarker].
	^ result