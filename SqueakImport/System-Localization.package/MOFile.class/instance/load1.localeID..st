experimental
load1: aFileName localeID: id
	"CASE1: 
		all of strings are loaded. 
		translation strings are converted to Squeak format on load time.
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
								pointers: translatedTable
								encoding: 'utf8'
								languageEnvironment: (Locale localeID: localeID) languageEnvironment .

		translations := Dictionary new.
		1 to: nStrings do: [:index |
			| key |
			key := originalStrings at: index.
			translations at: key put: index.
		].
		originalTable := nil.
	] ensure: [strm close].