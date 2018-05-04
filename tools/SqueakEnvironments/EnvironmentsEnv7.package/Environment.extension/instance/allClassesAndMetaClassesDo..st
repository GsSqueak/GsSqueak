*EnvironmentsEnv7-classes and traits
allClassesAndMetaClassesDo: aBlock 
	self allClassesDo: [:aClass |
		aBlock value: aClass theNonMetaClass.
		aBlock value: aClass theMetaClass]
