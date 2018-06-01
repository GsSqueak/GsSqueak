utility
deleteFolder

	self fileDirectory ifNotNil: [:dir | dir assureAbsence]