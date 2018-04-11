accessing
peekPosition
	self fetchMoreEvents.
	"self flushNonKbdEvents. -- mt: Should not be necessary here."
	^ mousePosition