public
load: aFileName localeID: id
	"all of original/translated strings are loaded. 
		but conversion of translation string (in utf-8 bytestring) to Squeak format will be defered.
		original-string/index pairs are registerd to Dictionary on load time.
		hash search can't be used"
	| strm originalTable translatedTable |
	localeID := id.
	strm := FileStream readOnlyFileNamed: aFileName.
	fileName := aFileName.
	[
		self loadHeader: strm.
		originalTable := self loadStringPointers: strm 
								offset: originalTableOffset.

		originalStrings := self loadStrings: strm 
								pointers: originalTable.

		translatedTable := self loadStringPointers: strm 
								offset: translatedTableOffset.

		translatedStrings := self loadStrings: strm 
								pointers: translatedTable.

		translations := Dictionary new: nStrings * 2.  "make too enough room to avoid #grow"
		1 to: nStrings do: [:index |
			| key |
			key := originalStrings at: index.
			translations at: key put: index.
		].
		originalStrings := nil.
	] ensure: [strm close].