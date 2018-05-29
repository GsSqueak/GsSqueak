stepping and presenter
stop

	state = #record ifTrue:
		[tape := tapeStream contents.
		saved := false].
	journalFile ifNotNil:
		[journalFile close].
	self pauseIn: self world.
	tapeStream := nil.
	state := nil.
	self setStatusLight: #ready.
	recordMeter ifNotNil: [recordMeter width: 1].

	self checkTape.