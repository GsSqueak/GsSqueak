scripts
assuredMethodInterfaceFor: aSelector 
	"Answer the method interface object for aSelector, creating it if it does
	not already exist."
	| _gsSqueakTemp_selSym _gsSqueakTemp_aMethodInterface |
	_gsSqueakTemp_selSym := aSelector asSymbol.
	_gsSqueakTemp_aMethodInterface := self scripts
				at: _gsSqueakTemp_selSym
				ifAbsentPut: [self nascentUserScriptInstance playerClass: self selector: _gsSqueakTemp_selSym].
	^ _gsSqueakTemp_aMethodInterface