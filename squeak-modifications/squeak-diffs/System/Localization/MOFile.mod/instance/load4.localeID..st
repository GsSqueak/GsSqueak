experimental
load4: aFileName localeID: id
	"CASE4: 
		all of strings are loaded. 
		loading and conversion of translation strings to Squeak format is executed on initialization time.
		only hash search can be used"
	| strm originalTable translatedTable |
	localeID := id.
	strm := FileStream readOnlyFileNamed: aFileName.
	fileName := aFileName.
	[
		self loadHeader: strm.
		self loadHashTable: strm.
		originalTable := self loadStringPointers: strm 
								offset: originalTableOffset.

		originalStrings := self loadStrings: strm 
								pointers: originalTable.

		translatedTable := self loadStringPointers: strm 
								offset: translatedTableOffset.

		translatedStrings := self loadStrings: strm 
								pointers: translatedTable
								encoding: 'utf-8'
								languageEnvironment: (Locale localeID: localeID) languageEnvironment .
	] ensure: [strm close].