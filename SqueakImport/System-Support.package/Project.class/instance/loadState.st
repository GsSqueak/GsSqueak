enter
loadState	

	self installProjectPreferences.
	ChangeSet  newChanges: changeSet.
	thumbnail ifNotNil: [:form | form unhibernate].
	TranscriptStream newTranscript: transcript.
