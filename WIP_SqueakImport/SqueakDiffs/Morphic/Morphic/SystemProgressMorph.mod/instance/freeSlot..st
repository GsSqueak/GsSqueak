private
freeSlot: number
	number > 0 ifFalse: [^self].
	lock critical: [| label |
		label := self labels at: number.
		(label isNil or: [label owner isNil]) ifTrue: [^self]. "Has been freed before"
		label delete.
		(self bars at: number) delete.
		self activeSlots: self activeSlots - 1.
		self activeSlots = 0
			ifTrue: [self delete]
			ifFalse: [self reposition]]