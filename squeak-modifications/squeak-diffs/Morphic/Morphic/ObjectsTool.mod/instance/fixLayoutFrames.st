layout
fixLayoutFrames
	"Adjust the boundary between the tabs or search pane and the parts bin, giving preference to the tabs."

	| oldY newY tp tpHeight |
	oldY := ((tp := self tabsPane
						ifNil: [self searchPane])
				ifNil: [^ self]) layoutFrame bottomOffset.
	tpHeight := tp hasSubmorphs
				ifTrue: [(tp submorphBounds outsetBy: tp layoutInset) height]
				ifFalse: [tp height].
	newY := (self buttonPane
				ifNil: [^ self]) height + tpHeight.
	oldY = newY
		ifTrue: [^ self].
	tp layoutFrame bottomOffset: newY.
	(self partsBin
		ifNil: [^ self]) layoutFrame topOffset: newY.
	submorphs
		do: [:m | m layoutChanged ]