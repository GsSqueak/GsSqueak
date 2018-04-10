geometry
position: newPos 
	super position: newPos.
	isCollapsed
		ifTrue: [collapsedFrame := self bounds]
		ifFalse: [fullFrame := self bounds]