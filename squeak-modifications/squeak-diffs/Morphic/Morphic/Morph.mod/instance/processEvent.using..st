events-processing
processEvent: anEvent using: defaultDispatcher
	"This is the central entry for dispatching events in morphic. Given some event and a default dispatch strategy, find the right receiver and let him handle it.
	WARNING: This is a powerful hook. If you want to use a different event dispatcher from the default, here is the place to hook it in. Depending on how the dispatcher is written (e.g., whether it calls simply #processEvent: or #processEvent:using:) you can change the dispatch strategy for entire trees of morphs. Similarly, you can disable entire trees of morphs from receiving any events whatsoever. Read the documentation in class MorphicEventDispatcher before playing with it.
	Event filters for this capture phase can both influence and overrule the way the receiver can reject the event. If the filter ignores the event, the whole event procecssing will stop. If the filtered event is still not ignored, the receiver can decide to still reject it end regular event dispatch will go on."
	
	| filteredEvent |
	filteredEvent := self sendFilterEventCapture: anEvent for: self.
	filteredEvent wasIgnored ifTrue: [^ filteredEvent].
	
	(self rejectsEvent: filteredEvent) ifTrue:[^#rejected].
	^defaultDispatcher dispatchEvent: filteredEvent with: self