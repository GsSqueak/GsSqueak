processing
processKerningTable: entry
	"Extract the kerning information for pairs of glyphs."
	| version  nTables covLow covHigh |
	version := entry nextUShort. "Skip table version"
	nTables := entry nextUShort. "Skip number of sub tables -- we're using the first one only"
	nTables = 0 ifTrue: [" This detection is hacky "
		entry skip: -4. "rewind"
		^ self processOSXKerningTable: entry].
	entry skip: 2. "Skip current subtable number"
	entry skip: 2. "Skip length of subtable"
	covHigh := entry nextByte.
	covLow := entry nextByte.

	"Make sure the format is right (kerning table and format type 0)"
	((covLow bitAnd: 2) = 2 or:[ covHigh ~= 0]) ifTrue:[^false].
	"Subtable"
	^ self processKerningSubTableType0: entry.
