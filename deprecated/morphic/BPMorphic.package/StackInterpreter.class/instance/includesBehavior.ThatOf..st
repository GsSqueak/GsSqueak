plugin primitive support
includesBehavior: aClass ThatOf: aSuperclass 
	"Return the equivalent of 
	aClass includesBehavior: aSuperclass.
	Note: written for efficiency and better inlining (only 1 temp)"
	| _gsSqueakTemp_theClass |
	aSuperclass = objectMemory nilObject
		ifTrue: [^ false].
	_gsSqueakTemp_theClass := aClass.
	[_gsSqueakTemp_theClass = aSuperclass
		ifTrue: [^ true].
	_gsSqueakTemp_theClass ~= objectMemory nilObject]
		whileTrue: [_gsSqueakTemp_theClass := self superclassOf: _gsSqueakTemp_theClass].
	^ false