initialization
fromURL: url
	"Make a book from an index and a bunch of pages on a server.  NOT showing any page!"

	| strm |
	strm := Cursor wait showWhile: [
		(ServerFile new fullPath: url) asStream].
	strm isString ifTrue: [self inform: 'Sorry, ',strm. ^ nil].
	self setProperty: #url toValue: url.
	self fromRemoteStream: strm.
	^ self