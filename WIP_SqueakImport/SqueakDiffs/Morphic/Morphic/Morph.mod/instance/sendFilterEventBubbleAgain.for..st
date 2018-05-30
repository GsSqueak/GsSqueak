events-processing
sendFilterEventBubbleAgain: anEvent for: anObject
	"Apply keyboard-specific and mouse-specific bubbling filters. If a filter changes the event type, filter again. WARNING: This is a powerful mechanism. Filters can create endless loops, which are difficult to debug."

	| filteredEvent |
	filteredEvent := anEvent.
	
	filteredEvent isKeyboard ifTrue: [
		filteredEvent := self sendFilterEvent: filteredEvent for: anObject to: self keyboardBubbleFilters.
		filteredEvent isKeyboard not ifTrue: [^ self sendFilterEventBubbleAgain: filteredEvent for: anObject]].
		
	filteredEvent isMouse ifTrue: [
		filteredEvent := self sendFilterEvent: filteredEvent for: anObject to: self mouseBubbleFilters.
		filteredEvent isMouse not ifTrue: [^ self sendFilterEventBubbleAgain: filteredEvent for: anObject]].

	^ filteredEvent