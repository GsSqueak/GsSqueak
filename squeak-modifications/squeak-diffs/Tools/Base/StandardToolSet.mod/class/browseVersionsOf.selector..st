browsing
browseVersionsOf: class selector: selector
	"Open and answer a browser on versions of the method.
	 If the method doesn't exist try and find version from the current change set.
	 If not found there, answer nil."
	| methodOrNil methodCategory |
	methodOrNil := class compiledMethodAt: selector ifAbsent: [].
	methodOrNil ifNil:
		[(ChangeSet current methodInfoFromRemoval: {class name. selector})
			ifNil: [^nil]
			ifNotNil:
				[:pair|
				methodOrNil := CompiledMethod toReturnSelfTrailerBytes:
									(CompiledMethodTrailer new sourcePointer: pair first).
				methodCategory := pair last]].
	^VersionsBrowser
		browseVersionsOf: methodOrNil
		class: class theNonMetaClass
		meta: class isMeta
		category: (methodCategory ifNil: [class organization categoryOfElement: selector])
		selector: selector