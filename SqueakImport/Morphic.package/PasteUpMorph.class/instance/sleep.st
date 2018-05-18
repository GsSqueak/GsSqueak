world state
sleep

	self flag: #bob.		"Alan wanted this"

	worldState canvas ifNil: [^ self  "already called (clean this up)"].
	Cursor normal show.	"restore the normal cursor"

">>>> Alan wanted this out
	(turtleTrailsForm ~~ nil and: [self confirm: 'May I clear the pen trails
in this worldState to save space?']) ifTrue: [self clearTurtleTrails].
<<<<<"

	worldState canvas: nil.		"free my canvas to save space"
	self fullReleaseCachedState.
