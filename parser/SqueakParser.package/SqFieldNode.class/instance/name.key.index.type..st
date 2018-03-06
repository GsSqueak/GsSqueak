initialize-release
name: varName key: objRef index: i type: type 
	fieldDef := objRef.
	^ super
		name: varName
		key: objRef key
		index: nil
		type: LdLitType