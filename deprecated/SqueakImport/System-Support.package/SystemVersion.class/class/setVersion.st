class initialization
setVersion
	"SystemVersion setVersion"

	| newName |
	newName := UIManager default
		request: ('Please name this system version.\The old version is:\',
					self current version, '\set on ', self current date asString) withCRs
 		initialAnswer: self current version.
	newName size > 0 ifTrue:
		[self newVersion: newName]