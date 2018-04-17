initialize-release
cleanUp: aggressive
	"Rehash all instances when cleaning aggressively"

	aggressive ifTrue: [ self compactAll ]
