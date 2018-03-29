compiled methods
accessModifierOfMethodHeader: header 
	"accessModifier bits:
	00 public
	01 private
	10 protected
	11 undefined"
	^ EnforceAccessControl
		ifTrue: [header >> MethodHeaderFlagBitPosition bitAnd: 3]
		ifFalse: [AccessModifierPublic]