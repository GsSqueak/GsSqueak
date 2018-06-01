actions
toggleShapes
	| tab sh stamps |
	"The sub panel that has the shape tools on it.  Rect, line..."
	stamps := self submorphNamed: 'stamps'.
	tab := self submorphNamed: 'shapeTab'.
	(sh := self submorphNamed: 'shapes') visible
		ifTrue: [sh hide.  tab top: stamps bottom-1]
		ifFalse: [sh comeToFront.  sh top: stamps bottom-9.  
				sh show.  tab top: sh bottom - tab height + 10].
	self layoutChanged.
	self changed
