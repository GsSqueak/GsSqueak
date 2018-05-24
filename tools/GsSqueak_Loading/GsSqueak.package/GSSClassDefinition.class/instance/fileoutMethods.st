fileout
fileoutMethods

	self fileoutMethods: self loadedInstanceMethods to: 'instance'.
	self fileoutMethods: self loadedClassMethods to: 'class'