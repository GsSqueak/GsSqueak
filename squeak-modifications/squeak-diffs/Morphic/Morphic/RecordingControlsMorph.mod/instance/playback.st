button commands
playback
	"The user hit the playback button"

	recorder verifyExistenceOfRecordedSound ifFalse: [^ self].
	recorder pause.
	recorder playback.
