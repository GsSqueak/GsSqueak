private protocol
fetchNextResponse
	"The FTP and similar protocols allow multi-line responses.
	If the response is multi-line, the fourth character of the first line is a  
	$- and the last line repeats the numeric code but the code is followed by 
	a space."

	| response result firstLine |
	result := '' writeStream.
	firstLine := self stream nextLine.
	result nextPutAll: firstLine.
	(self responseIsContinuation: firstLine) ifTrue: 
		["continued over multiple lines. Discard continuation lines."
			[response := self stream nextLine.
			response ifNil: [^nil].
			self response: response indicatesEndOf: firstLine.] 
					whileFalse: [result cr; nextPutAll: response].
			result cr; nextPutAll: response].
	self lastResponse: result contents