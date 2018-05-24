instance creation
textFromStream: aBinaryStream
	
	| reader readerClass text |
	readerClass := self. "no auto-detection yet"
	aBinaryStream reset.
	reader := readerClass new on: aBinaryStream.
	Cursor read showWhile: [
		text := reader nextText.
		reader close].
	^ text
