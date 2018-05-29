accessing
classMethods

	| modifiedMethods originalMethods |
	modifiedMethods := self loadedClassMethods ifNil: [Array new].
	originalMethods := self methodDefinitionsForClass: self realClass theMetaClass.
	^ self overlayMethods: originalMethods with: modifiedMethods