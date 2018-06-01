class initialization
initialize

	"CodeHolder initialize"

	ContentsSymbolQuints := self defaultContentsSymbolQuints asOrderedCollection.
	EditContentsOptions := Dictionary new.
	self defaultEditContentsOptions
		do: [:opt | EditContentsOptions at: opt key put: opt value]