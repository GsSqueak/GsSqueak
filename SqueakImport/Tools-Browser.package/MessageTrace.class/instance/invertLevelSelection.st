actions
invertLevelSelection
	"The user wants to be able to quickly and easily assemble message-traces.  When browsing senders or implementors of a heavily overloaded selector, typically just one or two messages are relevant out of several.  In that situation, the user need merely select the range of relevant methods to arrive within two gestures of trimming the irrelevant methods:  Command+I (capital eye) to invert the selection within the local group followed by Command+d to remove that selection from the browser."
	| index currentLevel start |
	currentLevel := self currentIndentionLevel ifNil:
		[ | possibilities |
		possibilities := ((1 to: messageSelections size) select:
			[ : idx | messageSelections at: idx ]) collect:
			[ : eachSelectedIndex | self indentionLevelAt: eachSelectedIndex ].
		possibilities asSet size > 1
			ifTrue: [ ^ self ]
			ifFalse:
				[ possibilities ifEmpty: [ ^ self ].
				start := messageSelections indexOf: true.
				possibilities anyOne ] ].
	"First invert at messageListIndex then crawl up and down from there until a different level is reached, inverting as we go."
	messageListIndex > 0 ifTrue: [ start := messageListIndex ].
	self toggleMessageSelectionAt: start.
	index := start.
	[ index := index - 1.
	index > 0 and: [ (self indentionLevelAt: index) = currentLevel ] ] whileTrue: [ self toggleMessageSelectionAt: index ].
	index := start.
	[ index := index + 1.
	index <= messageList size and: [ (self indentionLevelAt: index) = currentLevel ] ] whileTrue: [ self toggleMessageSelectionAt: index ].
	self
		 messageListIndex: 0 ;
		 changed: #messageList