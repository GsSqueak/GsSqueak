package deps
computePackageDependencies: pkgName
	"Compute the dependencies for the given package"
	| pi |
	classDeps := Dictionary new.
	packageDeps := Dictionary new.
	pkgName ifNil:[^self].
	pi := PackageOrganizer default packageNamed: pkgName ifAbsent:[^self]. "unloaded"
	pi classes do:[:pkgClass| 
		(classDeps at: (pkgClass superclass ifNil:[ProtoObject]) name
			ifAbsentPut:[OrderedCollection new]) add: 
				(MethodReference class: pkgClass selector: #Definition)].

	pi methods do:[:mref| | cm |
		cm := mref compiledMethod.
		1 to: cm numLiterals do:[:i| | lit |
			((lit := cm literalAt: i) isVariableBinding and:[lit value isBehavior]) ifTrue:[
				(classDeps at: lit value name ifAbsentPut:[OrderedCollection new])
					add: (MethodReference class: cm methodClass selector: cm selector)]]].

	classDeps keys do:[:className| | aClass pkg |
		aClass := Smalltalk classNamed: className.
		pkg := aClass ifNil: [nil] ifNotNil: [PackageOrganizer default packageOfClass: aClass ifNone:[nil]].
		pkg ifNil:[
			Transcript cr; show: 'WARNING: No package for ', className.
			(classDeps removeKey: className) do:[:each| Transcript crtab; show: each].
		] ifNotNil:[
			(packageDeps at: pkg name ifAbsentPut:[OrderedCollection new]) add: className.
		].
	].

	(packageDeps removeKey: pkgName ifAbsent:[#()]) do:[:each|
		classDeps removeKey: each ifAbsent:[].
	].