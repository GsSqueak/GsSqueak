classes and traits
allClassesAndMetaClassesDo: aBlock 
	self allClassesDo: [:aClass |
		aBlock theNonMetaClass value: aClass.
		aBlock theMetaClass value: aClass]
