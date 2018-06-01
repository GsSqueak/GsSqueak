cache access
doPagesInMemory: aBlock
	"Evaluate aBlock for each page whose contentsMorph is in-memory.  Don't add or remove pages while in this loop."

	PageCache do: [:sqkPage |
		sqkPage isContentsInMemory ifTrue: [aBlock value: sqkPage]].