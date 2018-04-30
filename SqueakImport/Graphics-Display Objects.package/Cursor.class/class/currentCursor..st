current cursor
currentCursor: aCursor 
	"Make the instance of cursor, aCursor, be the current cursor. Display it. 
	Create an error if the argument is not a Cursor."

	(aCursor isKindOf: self)
		ifTrue: [CurrentCursor := aCursor.
				self useBiggerCursors
					ifTrue: [[^ aCursor asBigCursor beCursor]
						on: Error do: ["fall through"]].
				aCursor beCursor]
		ifFalse: [self error: 'The new cursor must be an instance of class Cursor']