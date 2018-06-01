accessing
setNewImageFrom: formOrNil 
	"Change the receiver's image to be one derived from the supplied
	form. If nil is supplied, clobber any existing image in the receiver, and
	in its place put a default graphic, either the one known to the receiver
	as its default value, else a squeaky mouse"
	| _gsSqueakTemp_defaultImage |
	formOrNil
		ifNotNil: [^ self image: formOrNil].
	_gsSqueakTemp_defaultImage := self defaultValueOrNil
				ifNil: [ScriptingSystem squeakyMouseForm].
	self image: _gsSqueakTemp_defaultImage