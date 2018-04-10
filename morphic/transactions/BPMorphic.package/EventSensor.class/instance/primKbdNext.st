private
primKbdNext
	"Allows for use of old Sensor protocol to get at the keyboard,
	as when running kbdTest or the InterpreterSimulator in Morphic"
	| _gsSqueakTemp_evtBuf |
	self flag: #refactor.
	"mt: Suspiciously similar to #peekKeyboardEvent"
	self fetchMoreEvents.
	keyboardBuffer isEmpty
		ifFalse: [^ keyboardBuffer next].
	self eventQueue
		ifNotNil: [:queue | 
			_gsSqueakTemp_evtBuf := queue
						nextOrNilSuchThat: [:buf | self isKbdEvent: buf].
			self flushNonKbdEvents].
	^ _gsSqueakTemp_evtBuf
		ifNotNil: [_gsSqueakTemp_evtBuf at: 3]