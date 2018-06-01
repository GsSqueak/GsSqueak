uniform page size
maintainsUniformPageSize: aBoolean
	"Set the property governing whether I maintain uniform page size"

	aBoolean
		ifFalse:
			[self removeProperty: #uniformPageSize]
		ifTrue:
			[self setProperty: #uniformPageSize toValue: currentPage extent]