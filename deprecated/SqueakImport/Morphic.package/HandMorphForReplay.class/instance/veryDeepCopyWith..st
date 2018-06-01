copying
veryDeepCopyWith: deepCopier
	"Handmorph blocks deep copy.  Go up to Morph"

	^ self perform: #veryDeepCopyWith: withArguments: {deepCopier} inSuperclass: Morph