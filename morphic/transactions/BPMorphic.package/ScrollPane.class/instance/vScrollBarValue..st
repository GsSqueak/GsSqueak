scrolling
vScrollBarValue: scrollValue 
	scroller hasSubmorphs
		ifFalse: [^ self].
	scroller offset: scroller offset x
			@ (scrollValue max: 0)