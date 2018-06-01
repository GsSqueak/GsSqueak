constants
primitiveTable
	| _gsSqueakTemp_cg |
	_gsSqueakTemp_cg := CCodeGenerator new.
	_gsSqueakTemp_cg vmClass: self.
	^ PrimitiveTable
		collect: [:thing | (thing isInteger
					or: ["quick prims, 0 for fast primitve fail"
						thing == #primitiveFail])
				ifTrue: [thing]
				ifFalse: [(self primitivesClass whichClassIncludesSelector: thing)
						ifNil: [#primitiveFail]
						ifNotNil: [:class | (_gsSqueakTemp_cg shouldIncludeMethodFor: class selector: thing)
								ifTrue: [thing]
								ifFalse: [#primitiveFail]]]]