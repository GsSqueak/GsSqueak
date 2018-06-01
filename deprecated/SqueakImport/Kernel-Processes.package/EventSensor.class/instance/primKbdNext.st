private
primKbdNext
	"Allows for use of old Sensor protocol to get at the keyboard,
	as when running kbdTest or the InterpreterSimulator in Morphic"
	| evtBuf |
	
	self flag: #refactor. "mt: Suspiciously similar to #peekKeyboardEvent"
	self fetchMoreEvents.
	keyboardBuffer isEmpty ifFalse:[^ keyboardBuffer next].
	self eventQueue ifNotNil: [:queue |
		evtBuf := queue nextOrNilSuchThat: [:buf | self isKbdEvent: buf].
		self flushNonKbdEvents].
	^ evtBuf ifNotNil: [evtBuf at: 3]
