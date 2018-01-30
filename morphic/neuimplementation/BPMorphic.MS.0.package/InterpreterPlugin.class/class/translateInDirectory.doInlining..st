translation
translateInDirectory: directory doInlining: inlineFlag 
	"This is the default method for writing out sources for a plugin. Several
	classes need special handling, so look at all implementors of this
	message "
	| _gsSqueakTemp_cg _gsSqueakTemp_fname _gsSqueakTemp_fstat |
	_gsSqueakTemp_fname := self moduleFileName.
	"don't translate if the file is newer than my timeStamp"
	_gsSqueakTemp_fstat := directory
				entryAt: _gsSqueakTemp_fname
				ifAbsent: [].
	_gsSqueakTemp_fstat
		ifNotNil: [self timeStamp < _gsSqueakTemp_fstat modificationTime
				ifTrue: [^ nil]].
	self initialize.
	_gsSqueakTemp_cg := self buildCodeGenerator.
	_gsSqueakTemp_cg
		storeCodeOnFile: (directory fullNameFor: _gsSqueakTemp_fname)
		doInlining: inlineFlag.
	^ _gsSqueakTemp_cg exportedPrimitiveNames asArray