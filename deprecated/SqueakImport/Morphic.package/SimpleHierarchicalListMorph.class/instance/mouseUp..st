event handling
mouseUp: event
 
	| clickedMorph highlightedMorph |
	clickedMorph := self itemFromPoint: event position.
	highlightedMorph := self valueOfProperty: #highlightedMorph ifAbsent: [].
	self removeProperty: #highlightedMorph.

	((model okToChange not
		or: [clickedMorph isNil])
		or: [clickedMorph ~~ highlightedMorph]) ifTrue: [
			highlightedMorph ifNotNil: [:m | m highlightForMouseDown: false].
			^ self].
	
	((autoDeselect isNil or: [autoDeselect]) and: [clickedMorph == selectedMorph]) 
		ifTrue: [self setSelectedMorph: nil]
		ifFalse: [self setSelectedMorph: clickedMorph].

	highlightedMorph highlightForMouseDown: false.	
	event hand newKeyboardFocus: self.
	Cursor normal show.