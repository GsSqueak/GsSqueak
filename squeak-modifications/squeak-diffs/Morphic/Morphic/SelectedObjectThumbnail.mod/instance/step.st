stepping and presenter
step
	| current |
	current := self selectedObject.

	self setBalloonText: (current isNil
				ifTrue: [noSelectedBalloonText]
				ifFalse: [current externalName]).
	""
	self makeThumbnailFrom: current