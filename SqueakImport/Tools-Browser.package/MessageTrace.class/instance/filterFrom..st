filtering
filterFrom: aBlock 
	"Filter the receiver's list down to only those items that satisfy aBlock, which takes a class an a selector as its arguments."
	| newList newAutoSelectStrings newMessageSelections oldList |
	oldList := Dictionary new.
	messageList do: [ : each | oldList at: each put: each ].
	newList := messageList class new.
	newAutoSelectStrings := autoSelectStrings class new.
	newMessageSelections := messageSelections class new.
	messageList withIndexDo:
		[ : each : index | (self class
			parse: each
			toClassAndSelector: aBlock) ifTrue:
				[ newList add: each.
				newAutoSelectStrings add: (autoSelectStrings at: index).
				newMessageSelections add: (messageSelections at: index) ] ].
	(self setFilteredList: newList) ifTrue:
		[ autoSelectStrings := newAutoSelectStrings.
		messageList do:
			[ : each | each stringVersion: (oldList at: each) asString ] ]