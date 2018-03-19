slot-kedama
addPatchVarNamed: nameSymbol 
	| _gsSqueakTemp_f |
	_gsSqueakTemp_f := KedamaPatchMorph newExtent: self costume dimensions.
	_gsSqueakTemp_f assuredPlayer assureUniClass.
	_gsSqueakTemp_f
		setNameTo: ((Smalltalk at: #'ActiveWorld') unusedMorphNameLike: _gsSqueakTemp_f innocuousName).
	self
		addInstanceVariable2Named: nameSymbol
		type: #Patch
		value: _gsSqueakTemp_f player.
	^ _gsSqueakTemp_f