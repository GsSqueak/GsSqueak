menu messages
setSearchString
	"Make the current selection, if any, be the current search string."
	self hasCaret
		ifTrue: [morph flash.
			^ self].
	self setSearch: self selection string