debug and other
userString
	"Do I have a text string to be searched on?"

	^ String streamContents: [:strm |
		1 to: self getListSize do: [:i |
			"must use asStringOrText because that's what the drawing uses, too"
			strm nextPutAll: (self getListItem: i) asStringOrText; cr]]