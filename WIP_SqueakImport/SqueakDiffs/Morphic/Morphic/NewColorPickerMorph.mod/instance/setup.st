initialize-release
setup
	self
		 color: (Color white darker) ;
		 cornerStyle: #rounded ;
		 changeTableLayout ;
		 hResizing: #shrinkWrap ;
		 vResizing: #shrinkWrap ;
		 extent: 240@240 ;
		 addMorphBack: hsvaMorph ;
		 addMorphBack: self newColorExpressionMorph ;
		 addMorphBack: self newBottomRow ;
		 layoutInset: 4 ;
		 cellInset: 2.
		
		Preferences menuAppearance3d
		ifTrue: [self addDropShadow].
	