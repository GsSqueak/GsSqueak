editing keys
enclose: aKeyboardEvent
	"Insert or remove bracket characters around the current selection."

	| character left right startIndex stopIndex oldSelection which t |
	character := aKeyboardEvent shiftPressed
					ifTrue: ['{}|"<>' at: ('[]\'',.' indexOf: aKeyboardEvent keyCharacter) ifAbsent: [aKeyboardEvent keyCharacter]]
					ifFalse: [aKeyboardEvent keyCharacter].
	self closeTypeIn.
	startIndex := self startIndex.
	stopIndex := self stopIndex.
	oldSelection := self selection.
	which := '([<{|"''9' indexOf: character ifAbsent: [ ^ false ].
	"Allow Control key in lieu of Alt+Shift for (, {, and double-quote."
	left := ((Preferences cmdKeysInText and: [ aKeyboardEvent controlKeyPressed ])
		ifTrue: [ '({<{|""(' ]
		ifFalse: ['([<{|"''(']) at: which.
	right := ((Preferences cmdKeysInText and: [ aKeyboardEvent controlKeyPressed ])
		ifTrue: [ ')}>}|"")' ] 
		ifFalse: [')]>}|"'')']) at: which.
	t := self text.
	((startIndex > 1 and: [stopIndex <= t size])
			and: [ (t at: startIndex-1) = left and: [(t at: stopIndex) = right]])
		ifTrue:
			["already enclosed; strip off brackets"
			self selectFrom: startIndex-1 to: stopIndex.
			self replaceSelectionWith: oldSelection]
		ifFalse:
			["not enclosed; enclose by matching brackets"
			self replaceSelectionWith:
				(Text string: (String with: left), oldSelection string, (String with: right) attributes: emphasisHere).
			self selectFrom: startIndex+1 to: stopIndex].
	^true