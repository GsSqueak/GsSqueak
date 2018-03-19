geometry
extent: aPoint
  super extent: aPoint	"Update vertical scroll bars because if text is wrapped."	"textMorph
		ifNotNil: [:tm | tm isAutoFit
				ifTrue: [self vSetScrollDelta]]"