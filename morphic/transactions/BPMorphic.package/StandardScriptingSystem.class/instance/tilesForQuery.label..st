-Etoys-parts bin
tilesForQuery: expressionString label: aLabel 
	"Answer scripting tiles that represent the query,"
	| _gsSqueakTemp_aPhrase _gsSqueakTemp_aTile |
	_gsSqueakTemp_aPhrase := SystemQueryPhrase new.
	_gsSqueakTemp_aTile := BooleanTile new.
	_gsSqueakTemp_aTile setExpression: expressionString label: aLabel.
	_gsSqueakTemp_aPhrase addMorph: _gsSqueakTemp_aTile.
	^ _gsSqueakTemp_aPhrase