-Etoys-tiles
openSyntaxView
	"Open a syntax view on the current method"
	| _gsSqueakTemp_class |
	self selectedMessageName
		ifNotNil: [:_gsSqueakTemp_selector | 
			_gsSqueakTemp_class := self selectedClassOrMetaClass.
			SyntaxMorph testClass: _gsSqueakTemp_class andMethod: _gsSqueakTemp_selector]