class initialization
initialize
	"SqueakPageCache initialize"

	GlobalPolicy := #neverWrite.
	PageCache := Dictionary new: 100.
		"forgets urls of pages, but ObjectOuts still remember them"
