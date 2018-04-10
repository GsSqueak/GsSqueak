accessing
setNewFormFrom: formOrNil 
	"Set the receiver's form as indicated. If nil is provided, then a default
	form will be used, possibly retrieved from the receiver's defaultValue
	property "
	| _gsSqueakTemp_defaultImage |
	formOrNil
		ifNotNil: [^ self form: formOrNil].
	_gsSqueakTemp_defaultImage := self defaultValueOrNil
				ifNil: [ScriptingSystem squeakyMouseForm].
	self form: _gsSqueakTemp_defaultImage