resize/collapse
expandBoxHit
	isCollapsed
		ifTrue: [self	hide;
					collapseOrExpand;
					expandToFullScreen;
					show]
		ifFalse: [self unexpandedFrame 
					ifNil: [self expandToFullScreen]
					ifNotNil: [self contractToOriginalSize]]