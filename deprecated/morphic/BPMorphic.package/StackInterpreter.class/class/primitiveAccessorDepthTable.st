constants
primitiveAccessorDepthTable
	| _gsSqueakTemp_cg |
	_gsSqueakTemp_cg := CCodeGenerator new.
	_gsSqueakTemp_cg vmClass: StackInterpreter.
	^ self primitiveTable
		collect: [:thing | | implementingClass method | (thing isInteger
					or: ["quick prims, 0 for fast primitve fail"
						thing == #primitiveFail
							or: [(implementingClass := self primitivesClass whichClassIncludesSelector: thing) isNil]])
				ifTrue: [-1]
				ifFalse: [method := _gsSqueakTemp_cg compileToTMethodSelector: thing in: implementingClass.
					_gsSqueakTemp_cg accessorDepthForMethod: method]]