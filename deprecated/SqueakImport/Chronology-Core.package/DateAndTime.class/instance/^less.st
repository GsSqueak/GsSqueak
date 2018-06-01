ansi protocol
< comparand 
	"comparand conforms to protocol DateAndTime,
	or can be converted into something that conforms."
	| lvalue rvalue comparandAsDateAndTime |
	comparandAsDateAndTime := comparand asDateAndTime.
	self offset = comparandAsDateAndTime offset
		ifTrue:
			[ lvalue := self.
			rvalue := comparandAsDateAndTime ]
		ifFalse:
			[ lvalue := self asUTC.
			rvalue := comparandAsDateAndTime asUTC ].
	^ lvalue julianDayNumber < rvalue julianDayNumber or:
		[ lvalue julianDayNumber > rvalue julianDayNumber
			ifTrue: [ false ]
			ifFalse:
				[ lvalue secondsSinceMidnight < rvalue secondsSinceMidnight or:
					[ lvalue secondsSinceMidnight > rvalue secondsSinceMidnight
						ifTrue: [ false ]
						ifFalse: [ lvalue nanoSecond < rvalue nanoSecond ] ] ] ]