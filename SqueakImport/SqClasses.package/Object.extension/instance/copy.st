*SqClasses-copying
copy
	"Answer another instance just like the receiver. Subclasses typically override postCopy; they typically do not override shallowCopy."

	^self shallowCopy postCopy
