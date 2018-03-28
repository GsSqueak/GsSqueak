initialize-release
setClass: classProxy
	"Set the state of a new, uninitialized Browser."

	| isMeta aClass |
	classProxy ifNil: [^ self].
	isMeta := classProxy isMeta.
	aClass := classProxy theNonMetaClass.
	
	self
		selectEnvironment: aClass environment;
		selectCategoryForClass: aClass;
		classListIndex: (self classListIndexOf: aClass name);
		metaClassIndicated: isMeta