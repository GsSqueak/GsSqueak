open/close
openInWorld: aWorld
	"This msg and its callees result in the window being activeOnlyOnTop"
	^ self anyOpenWindowLikeMe
		ifEmpty: 
			[ self 
				bounds: (RealEstateAgent initialFrameFor: self world: aWorld) ;
				openAsIsIn: aWorld ]
		ifNotEmptyDo:
			[ : windows | 
			windows anyOne
				expand ;
				beKeyWindow ; 
				postAcceptBrowseFor: self ].