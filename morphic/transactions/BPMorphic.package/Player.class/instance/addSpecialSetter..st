slots-user
addSpecialSetter: selector 
	"For the special setters, fooIncreaseBy:, fooDecreaseBy:, fooMultiplyBy:,
	add a method that does them."
	| _gsSqueakTemp_instVar _gsSqueakTemp_code |
	self assureUniClass.
	_gsSqueakTemp_instVar := (selector allButLast: 11) asLowercase.
	"all three are 11 long!"
	(self respondsTo: ('set' , _gsSqueakTemp_instVar capitalized , ':') asSymbol)
		ifFalse: [^ false].
	_gsSqueakTemp_code := String
				streamContents: [:strm | 
					strm nextPutAll: selector , ' amount';
						 crtab.
					strm nextPutAll: 'self set' , _gsSqueakTemp_instVar capitalized , ': (self get' , _gsSqueakTemp_instVar capitalized;
						 space.
					(selector endsWith: 'IncreaseBy:')
						ifTrue: [strm nextPut: $+].
					(selector endsWith: 'DecreaseBy:')
						ifTrue: [strm nextPut: $-].
					(selector endsWith: 'MultiplyBy:')
						ifTrue: [strm nextPut: $*].
					strm nextPutAll: ' amount)'].
	self class
		compileSilently: _gsSqueakTemp_code
		classified: 'access'
		notifying: nil.
	^ true