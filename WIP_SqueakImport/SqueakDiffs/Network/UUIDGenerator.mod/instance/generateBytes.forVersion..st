instance creation
generateBytes: aUUID forVersion: aVersion
	| versionID fixedValue |
	
	aVersion = 4 ifFalse: [^ self error: 'Unsupported version'].

	self fillRandomly: aUUID.
	versionID := ((aUUID at: 7) bitAnd: 16r0F) bitOr: 16r40. "Version 4"
	fixedValue := ((aUUID at: 9) bitAnd: 16r3F) bitOr: 16r80. "Fixed 8..b value"
	aUUID
		at: 7 put: versionID;
		at: 9 put: fixedValue.