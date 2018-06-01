events-filtering
filterEvent: event for: target

	^ self filterBlock
		ifNil: [event]
		ifNotNil: [:b | b cull: event cull: target]