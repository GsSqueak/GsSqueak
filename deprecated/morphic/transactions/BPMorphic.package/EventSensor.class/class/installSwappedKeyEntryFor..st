key decode table
installSwappedKeyEntryFor: c 
	| _gsSqueakTemp_key |
	_gsSqueakTemp_key := c asInteger.
	"first do control->alt key"
	KeyDecodeTable at: {_gsSqueakTemp_key bitAnd: 159. 2} put: {_gsSqueakTemp_key. 8}.
	"then alt->control key"
	KeyDecodeTable at: {_gsSqueakTemp_key. 8} put: {_gsSqueakTemp_key bitAnd: 159. 2}