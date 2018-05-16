accessing
defaultOrNil

	^ super defaultOrNil ifNotNil: [:default |
		default isBehavior ifTrue: [default new] ifFalse: [default]]
