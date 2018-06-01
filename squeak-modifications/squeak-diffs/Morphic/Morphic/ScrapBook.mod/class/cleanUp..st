initialize-release
cleanUp: aggressive
	"Nuke the scraps book when cleaning aggressively"

	aggressive ifTrue: [Default := nil].