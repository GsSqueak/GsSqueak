miscellaneous
fileOutChanges
	"Bug workaround for squeak-flap 'fileOutChanges' buttons which for a while were mistakenly sending their requests here..."

	^ ChangeSet current verboseFileOut. 