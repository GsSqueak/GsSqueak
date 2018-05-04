target directories
sourceDirectoryName: aString
	"Sanity check really ought to be added, This is the root directory for where the sources will be WRITTEN"
	sourceDirName := aString.
	(FileDirectory on: aString) assureExistence.
	self changed: #sourceDirectory.
	^true