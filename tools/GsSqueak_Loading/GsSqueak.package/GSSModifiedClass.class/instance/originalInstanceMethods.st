accessing - real class
originalInstanceMethods

	| modifiedMethods originalMethods |
	modifiedMethods := self loadedInstanceMethods ifNil: [Array new].
	originalMethods := self methodDefinitionsForClass: self realClass theNonMetaClass.
	^ self overlayMethods: originalMethods with: modifiedMethods