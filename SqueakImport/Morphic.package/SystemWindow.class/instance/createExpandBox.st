initialization
createExpandBox
	^ (self createBox: self class expandBoxImage)
		actionSelector: #expandBoxHit;
		setBalloonText: 'expand this window' translated