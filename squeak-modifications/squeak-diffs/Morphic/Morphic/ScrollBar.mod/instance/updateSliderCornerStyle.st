updating
updateSliderCornerStyle
	"Right now, only the slider's corner style is affected. Buttons and paging area remain square. Looks better somehow... :-)"
	
	slider cornerStyle: (self class roundedScrollBarLook ifTrue: [#rounded] ifFalse: [#square]).