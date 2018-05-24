uniform page size
maintainsUniformPageSize: aBoolean 
	"Set the property governing whether I maintain uniform page size"
	aBoolean
		ifTrue: [self setProperty: #uniformPageSize toValue: currentPage extent]
		ifFalse: [self removeProperty: #uniformPageSize]