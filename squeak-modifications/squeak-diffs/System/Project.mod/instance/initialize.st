initialization
initialize
	"Initialize the project, seting the CurrentProject as my parentProject and initializing my project preferences from those of the CurrentProject"
	Project addingProject: self.
	changeSet := ChangeSet new.
	transcript := TranscriptStream new.
	displayDepth := Display depth.
	parentProject := CurrentProject ifNil: [self].
	self initializeProjectPreferences

