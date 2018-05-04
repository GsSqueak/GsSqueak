image segment in/out
restoreHeadersFrom: firstIn to: lastIn from: hdrBaseIn and: firstOut to: lastOut from: hdrBaseOut

	"Restore headers smashed by forwarding links"
	self subclassResponsibility