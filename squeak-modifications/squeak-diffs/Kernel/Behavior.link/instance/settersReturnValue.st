*Tools-Browser-accessors
settersReturnValue
	"Determine whether the browser's createInstVarAccessors code will generate
	 setters that answer self (the default here) or the value set.  Classes that want
	 to answer the value set (e.g. VMStructType) override."
	^false