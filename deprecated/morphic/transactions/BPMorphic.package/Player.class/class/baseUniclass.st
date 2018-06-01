user-scripted subclasses
baseUniclass
	"Answer the uniclass that new instances should be instances of; this
	protocol allows for individual cards of a background to have their own
	class "
	| _gsSqueakTemp_curr |
	_gsSqueakTemp_curr := self.
	[_gsSqueakTemp_curr theNonMetaClass superclass name endsWithDigit]
		whileTrue: [_gsSqueakTemp_curr := _gsSqueakTemp_curr superclass].
	^ _gsSqueakTemp_curr"CardPlayer100 baseUniclass 
	CardPlayer100X baseUniclas
	"