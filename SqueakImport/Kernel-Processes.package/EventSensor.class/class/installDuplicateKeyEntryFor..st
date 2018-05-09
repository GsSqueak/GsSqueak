key decode table
installDuplicateKeyEntryFor: c
	| key |
	key := c asInteger.
	"first do control->alt key"
	KeyDecodeTable at: { key bitAnd: 16r9F . 2 } put: { key . 8 }.
	"then alt->alt key"
	KeyDecodeTable at: { key . 8 } put: { key . 8 }
