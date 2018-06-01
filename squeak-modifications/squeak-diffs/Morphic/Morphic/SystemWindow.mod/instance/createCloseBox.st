initialization
createCloseBox
	^ (self createBox: self class closeBoxImage)
		actionSelector: #closeBoxHit;
		setBalloonText: 'close this window' translated