events-processing
handleEvent: anEvent
  "Apply event filters and then handle the resulting event. We have to
	return the event to chain filters."

  | filteredEvent |
  filteredEvent := self sendFilterEventBubble: anEvent for: self.
  filteredEvent wasIgnored
    ifFalse: [ filteredEvent sentTo: self ].
  ^ filteredEvent