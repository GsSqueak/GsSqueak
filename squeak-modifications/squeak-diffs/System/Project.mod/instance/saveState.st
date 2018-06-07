enter
saveState
	"Save the current state in me prior to leaving this project"

	self saveProjectPreferences.
	changeSet := ChangeSet current.
	thumbnail ifNotNil: [:form | form hibernate].
	transcript := Transcript.