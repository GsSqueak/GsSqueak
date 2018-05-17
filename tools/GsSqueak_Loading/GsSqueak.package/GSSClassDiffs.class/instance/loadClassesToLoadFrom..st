loading - specifications
loadClassesToLoadFrom: aFileDirectory

	| classFile |
	classFile := aFileDirectory entryAt: 'classesToLoad' ifAbsent: [^ Array new].
	^ classFile readStream contents lines collect: [:className | className asSymbol]