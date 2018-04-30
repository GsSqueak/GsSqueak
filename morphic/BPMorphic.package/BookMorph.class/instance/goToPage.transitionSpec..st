navigation
goToPage: pageNumber transitionSpec: transitionSpec 
	| _gsSqueakTemp_pageMorph |
	pages isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_pageMorph := (self hasProperty: #dontWrapAtEnd)
				ifTrue: [pages atPin: pageNumber]
				ifFalse: [pages atWrap: pageNumber].
	^ self goToPageMorph: _gsSqueakTemp_pageMorph transitionSpec: transitionSpec