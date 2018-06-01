accessing
instanceMethods

	| modifiedMethods originalMethods |
	modifiedMethods := self loadedInstanceMethods.
	originalMethods := self methodDefinitionsForClass: self realClass theNonMetaClass.
	^ self overlayMethods: originalMethods with: modifiedMethods