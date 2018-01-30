resize handling
addPaneHSplitters
	| remaining targetY sameY |
	remaining := self paneMorphs
				reject: [:each | each layoutFrame bottomFraction = 1
						or: [each layoutFrame hasFixedHeight]].
	[remaining notEmpty]
		whileTrue: [targetY := remaining first layoutFrame bottomFraction.
			sameY := self paneMorphs
						select: [:each | each layoutFrame bottomFraction = targetY].
			self addPaneHSplitterBetween: remaining first and: sameY.
			remaining := remaining copyWithoutAll: sameY]