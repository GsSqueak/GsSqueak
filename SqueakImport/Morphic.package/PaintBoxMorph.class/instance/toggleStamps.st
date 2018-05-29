actions
toggleStamps
	| tab otherTab st shapes |
	"The sub panel that has the stamps in it.  For saving and moving parts of an image."
	shapes := self submorphNamed: 'shapes'.
	otherTab := self submorphNamed: 'shapeTab'.
	tab := self submorphNamed: 'stampTab'.
	(st := self submorphNamed: 'stamps') visible
		ifTrue: [st hide.  st bottom: self bottom.  tab top: self bottom-1.
				shapes top: self bottom-9.
				otherTab top: (shapes visible ifTrue: [shapes bottom - otherTab height + 10] 
									ifFalse: [self bottom-1])]
		ifFalse: [st top: self bottom-10.  st show.  tab top: st bottom-0.
				shapes top: st bottom-9.
				otherTab top: (shapes visible ifTrue: [shapes bottom - otherTab height + 10] 
									ifFalse: [st bottom-0])].
	self layoutChanged.
	self changed