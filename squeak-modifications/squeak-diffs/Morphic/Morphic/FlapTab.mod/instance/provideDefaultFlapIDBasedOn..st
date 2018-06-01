initialization
provideDefaultFlapIDBasedOn: aStem
	"Provide the receiver with a default flap id"

	| aNumber usedIDs anID  |
	aNumber := 0.
	usedIDs := FlapTab allSubInstances select: [:f | f ~~ self] thenCollect: [:f | f flapIDOrNil].
	anID := aStem.
	[usedIDs includes: anID] whileTrue:
		[aNumber := aNumber + 1.
		anID := aStem, (aNumber asString)].
	self flapID: anID.
	^ anID