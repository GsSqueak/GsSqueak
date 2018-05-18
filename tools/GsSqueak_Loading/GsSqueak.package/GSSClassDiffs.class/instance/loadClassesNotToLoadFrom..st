loading - specifications
loadClassesNotToLoadFrom: aFileDirectory

	| classFile |
	classFile := aFileDirectory entryAt: 'classesNotToLoad' ifAbsent: [^ Array new].
	^ classFile readStream contents lines collect: [:className | className asSymbol]