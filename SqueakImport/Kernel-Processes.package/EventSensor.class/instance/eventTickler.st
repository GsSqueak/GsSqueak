private
eventTickler
	"Poll infrequently to make sure that the UI process is not been stuck. 
	If it has been stuck, then spin the event loop so that I can detect the 
	interrupt key."
	| delay |
	delay := Delay forMilliseconds: self class eventPollPeriod.
	self lastEventPoll.	"ensure not nil."
	[| delta | 
	[ delay wait.
	delta := Time millisecondClockValue - lastEventPoll.
	(delta < 0
			or: [delta > self class eventPollPeriod])
		ifTrue:
			["force check on rollover"
			self fetchMoreEvents]]
		on: Error do: [:ex | ]] repeat.