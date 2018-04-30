initialization
fromURL: url 
	"Make a book from an index and a bunch of pages on a server. NOT
	showing any page!"
	| _gsSqueakTemp_strm |
	_gsSqueakTemp_strm := Cursor wait
				showWhile: [(ServerFile new fullPath: url) asStream].
	_gsSqueakTemp_strm isString
		ifTrue: [self inform: 'Sorry, ' , _gsSqueakTemp_strm.
			^ nil].
	self setProperty: #url toValue: url.
	self fromRemoteStream: _gsSqueakTemp_strm