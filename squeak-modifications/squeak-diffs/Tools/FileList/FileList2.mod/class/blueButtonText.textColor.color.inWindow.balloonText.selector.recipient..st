blue ui
blueButtonText: aString textColor: textColor color: aColor inWindow: window balloonText: balloonText selector: sel recipient: recip 
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
		 useRoundedCorners;
		 setBalloonText: balloonText.
	result
		on: #mouseUp
		send: sel
		to: recip.
	aColor isNil
		ifFalse: [""
			result color: aColor.
			result borderColor: aColor muchDarker].
	^ result