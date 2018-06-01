initialization
setTitleParametersFor: aMenuTitle 
	aMenuTitle
		color: (self userInterfaceTheme titleColor
				ifNil: [Color transparent]);
		
		borderStyle: (self userInterfaceTheme titleBorderStyle
				ifNil: [BorderStyle default]);
		
		borderColor: (self userInterfaceTheme titleBorderColor
				ifNil: [Color
						r: 0.6
						g: 0.7
						b: 1]);
		
		borderWidth: (self userInterfaceTheme titleBorderWidth
				ifNil: [0]);
		
		cornerStyle: (self wantsRoundedCorners
				ifTrue: [#rounded]
				ifFalse: [#square]);
		 vResizing: #shrinkWrap;
		 wrapCentering: #center;
		 cellPositioning: #center;
		 cellInset: 5;
		
		layoutInset: (5 @ 0 corner: 5 @ 0)