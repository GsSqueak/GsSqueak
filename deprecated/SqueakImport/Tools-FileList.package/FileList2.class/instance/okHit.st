private
okHit

	ok := true.
	currentDirectorySelected
		ifNil: [ Beeper beep ]
		ifNotNil: [
			self class lastSelDir: directory.
			modalView delete ]