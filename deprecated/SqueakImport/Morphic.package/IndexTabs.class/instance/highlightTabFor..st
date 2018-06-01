highlighting
highlightTabFor: aBook
	| theOne |
	self tabMorphs do: [:m |
		(m morphToInstall == aBook)
				ifTrue: [m highlight.  theOne := m]
				ifFalse: [m unHighlight]].
	^ theOne
