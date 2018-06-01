accessing
isContentsInMemory
	"Is my contentsMorph in memory, or is it an ObjectOut tombstone?  Be careful not to send it any message."

	^ (contentsMorph xxxClass inheritsFrom: Object) and: [(contentsMorph == nil) not]