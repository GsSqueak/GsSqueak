resize/collapse
expandToFullScreen
	self unexpandedFrame ifNil: [ self unexpandedFrame: fullFrame ].
	self fullScreen.
	expandBox ifNotNil: [expandBox setBalloonText: 'contract to original size' translated]