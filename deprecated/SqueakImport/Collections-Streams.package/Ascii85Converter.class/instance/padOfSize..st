private
padOfSize: anInteger

	anInteger = 1 ifTrue: [ ^#[0] ].
	anInteger = 2 ifTrue: [ ^#[0 0] ].
	anInteger = 3 ifTrue: [ ^#[0 0 0] ].
	self error: 'Should not reach'