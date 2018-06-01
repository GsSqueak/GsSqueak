converting
joinSeparatedBy: aSeparator
	"Returns a string, which is a concatenation of each element's string representation separated by another string."

	^ String streamContents: [:stream |
		self
			do: [:ea | stream nextPutAll: ea asString]
			separatedBy: [stream nextPutAll: aSeparator asString]]