image segment in/out
restoreHeadersFrom: firstIn to: lastIn from: hdrBaseIn and: firstOut to: lastOut from: hdrBaseOut

	"Restore headers smashed by forwarding links"
	| tablePtr oop header |
	tablePtr := firstIn.
	[self oop: tablePtr isLessThanOrEqualTo: lastIn] whileTrue:
		[oop := self longAt: tablePtr.
		header := self longAt: hdrBaseIn + (tablePtr-firstIn).
		self longAt: oop put: header.
		tablePtr := tablePtr + self bytesPerWord].
	tablePtr := firstOut.
	[self oop: tablePtr isLessThanOrEqualTo: lastOut] whileTrue:
		[oop := self longAt: tablePtr.
		header := self longAt: hdrBaseOut + (tablePtr-firstOut).
		self longAt: oop put: header.
		tablePtr := tablePtr + self bytesPerWord].
	
	"Clear all mark bits"
	oop := self firstObject.
	[self oop: oop isLessThan: freeStart] whileTrue:
		[(self isFreeObject: oop) ifFalse:
			[self longAt: oop put: ((self longAt: oop) bitAnd: self allButMarkBit)].
		oop := self objectAfter: oop]