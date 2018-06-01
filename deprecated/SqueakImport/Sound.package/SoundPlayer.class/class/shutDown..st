snapshotting
shutDown: quitting
	"Stop player process, for example before snapshotting."

	quitting ifTrue: [
		self stopPlayerProcess.
		ReverbState := nil].