accessing
mostRecentThread

	| projectNames threadName |
	self cleanUp.
	projectNames := (mostRecent collect: [ :each | {each first} ]) reversed.

	threadName := UIManager default 
		request: 'Please name this thread.' 
		initialAnswer: 'Recent projects @ ',Time now printString.
	threadName isEmptyOrNil ifTrue: [^nil].
	"rbb 3/1/2005 - Should be refactored to eliminate Morphic dependency"
	InternalThreadNavigationMorph know: projectNames as: threadName.
	^threadName
