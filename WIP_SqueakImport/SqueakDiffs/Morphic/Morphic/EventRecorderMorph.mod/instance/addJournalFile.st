initialization
addJournalFile
	"In case there is a chance of not regaining control to stop recording and save a file, the EventRecorder can write directly to file as it is recording.  This is useful for capturing a sequence that results in a nasty crash."

	journalFile ifNotNil: [journalFile close].
	journalFile := FileStream newFileNamed: 'EventRecorder.tape'.
	journalFile nextPutAll:'Event Tape v1 ASCII'; cr.