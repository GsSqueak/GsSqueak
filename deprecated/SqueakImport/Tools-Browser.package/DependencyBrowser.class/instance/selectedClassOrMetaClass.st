class list
selectedClassOrMetaClass
	"Answer the class or metaclass that is currently selected. Answer nil if no selection 
	exists."
	classList ifNil: [^nil].
	^ classList at: classListIndex ifAbsent: [nil].