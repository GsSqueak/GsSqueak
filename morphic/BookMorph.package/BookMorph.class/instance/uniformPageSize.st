uniform page size
uniformPageSize
	"Answer the uniform page size to maintain, or nil if the option is not set"
	^ self
		valueOfProperty: #uniformPageSize
		ifAbsent: []