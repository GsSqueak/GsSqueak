image save/restore
normalizeFloatOrderingInImage
	"Float objects were saved in platform word ordering. Reorder them into the
	traditional object format."

	<inline: false>
	<var: #floatData type: 'unsigned int *'>
	<var: #val type: 'unsigned int'>
	self isBigEnder
		ifFalse: [ | oop | "Swap words within Float objects, taking them out of native platform ordering"
				oop := objectMemory firstAccessibleObject.
				[oop = nil] whileFalse: [ | val |
					(objectMemory isFreeObject: oop) ifFalse: [
						(objectMemory fetchClassOf: oop) = objectMemory classFloat
							ifTrue: [ | floatData |
								floatData := self cCoerce: (objectMemory firstIndexableField: oop) to: 'unsigned int *'.
								val := floatData at: 0.
								floatData at: 0 put: (floatData at: 1).
								floatData at: 1 put: val].
						oop := objectMemory accessibleObjectAfter: oop]]]
