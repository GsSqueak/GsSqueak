accessing
sticky: aBoolean 
	"change the receiver's sticky property"
	(extension isNil
			and: [aBoolean not])
		ifTrue: [^ self].
	self assureExtension sticky: aBoolean