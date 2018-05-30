private
parseLines: aCollection 
"private - parse aCollection of lines from a server response"
	^ aCollection
		collect: [:each | self parseLine: each]