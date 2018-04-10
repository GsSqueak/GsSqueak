accessing
peekKeyboardEvent
	"Return the next keyboard char event from the receiver or nil if none
	available "
	^ self eventQueue
		ifNotNil: [:queue | 
			self fetchMoreEvents.
			queue
				nextOrNilSuchThat: [:buf | buf first = EventTypeKeyboard
						and: [buf fourth = EventKeyChar]]]