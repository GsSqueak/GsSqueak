volume list and pattern
pathAndPattern: stringOrText 
	"Answers both path and pattern"
	| _gsSqueakTemp_base _gsSqueakTemp_pat _gsSqueakTemp_aString |
	_gsSqueakTemp_aString := stringOrText asString.
	_gsSqueakTemp_base := _gsSqueakTemp_aString copyUpToLast: directory pathNameDelimiter.
	_gsSqueakTemp_pat := _gsSqueakTemp_aString copyAfterLast: directory pathNameDelimiter.
	self changed: #pathAndPattern.
	"avoid asking if it's okToChange"
	pattern := _gsSqueakTemp_pat.
	self
		directory: (FileDirectory on: _gsSqueakTemp_base).
	self changed: #pathAndPattern.
	self changed: #selectedPath