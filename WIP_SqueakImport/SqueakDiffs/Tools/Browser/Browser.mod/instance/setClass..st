initialize-release
setClass: aBehavior
	"Set the state of a new, uninitialized Browser."

	| isMeta aClass |
	aBehavior ifNil: [^ self].
	(aBehavior isKindOf: Metaclass)
		ifTrue: [
			isMeta := true.
			aClass := aBehavior soleInstance]
		ifFalse: [
			isMeta := false.
			aClass := aBehavior].
		
	self
		selectEnvironment: aClass environment;
		selectCategoryForClass: aClass;
		classListIndex: (self classListIndexOf: aClass name);
		metaClassIndicated: isMeta.