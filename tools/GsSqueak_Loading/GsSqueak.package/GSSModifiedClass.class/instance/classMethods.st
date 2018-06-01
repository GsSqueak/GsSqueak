accessing
classMethods

	| modifiedMethods originalMethods |
	modifiedMethods := self loadedClassMethods.
	originalMethods := self methodDefinitionsForClass: self realClass theMetaClass.
	^ self overlayMethods: originalMethods with: modifiedMethods