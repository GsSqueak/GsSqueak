top window
noteTopWindowIn: aWorld
	"Look for a new top window in the given world. We have to reset the former top window because this is global state shared between all worlds."

	| newTopWindow |
	TopWindow := nil.
	newTopWindow := nil.

	aWorld ifNil: [^ self].

	aWorld submorphsDo: [:m |
		(m isSystemWindow and: [newTopWindow isNil])
			ifTrue: [newTopWindow := m].
		
		self flag: #refactor. "This really belongs in a special ProjWindow class"
		(m model isKindOf: Project)
			ifTrue: [m label ~= m model name ifTrue: [m setLabel: m model name]]].

	newTopWindow ifNotNil: [newTopWindow beKeyWindow].