*SqClasses-printing
metaFormatterClass
	"BE CAREFUL! If you provide your own class to treat class-side (resp. meta) methods, you MUST account for the #meta*Class selector to use the default implementation in that case. That is, the methods behind #meta*Class MUST always get the default Smalltalk treatment."

	^ super formatterClass
