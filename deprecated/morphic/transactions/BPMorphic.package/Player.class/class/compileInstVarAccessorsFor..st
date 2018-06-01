slots
compileInstVarAccessorsFor: varName 
	"Compile getters and setteres for the given instance variable name"
	| _gsSqueakTemp_nameString |
	_gsSqueakTemp_nameString := varName asString capitalized.
	self compileSilently: 'get' , _gsSqueakTemp_nameString , '
	^ ' , varName classified: 'access'.
	self compileSilently: 'set' , _gsSqueakTemp_nameString , ': val
	' , varName , ' := val' classified: 'access'