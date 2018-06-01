copying
postCopy
	"Beware: do share the bindings, so changing a binding value in the copy will also change it in the original.
	Copying the bindings would not make sense: we hold weakly on them, so they would die at first garbage collection."

	| oldVacuum |
	super postCopy.
	oldVacuum := vacuum.
	vacuum := Object new.
	array := array collect: [ :association |
		association ifNotNil: [
			association == oldVacuum
				ifTrue: [ vacuum ]
				ifFalse: [ association ] ] ]