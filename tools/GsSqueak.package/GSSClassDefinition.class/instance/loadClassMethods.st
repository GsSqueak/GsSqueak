loading
loadClassMethods

	| entry |
	entry := self fileDirectory entryAt: 'class' ifAbsent: [^ self].
	entry isDirectory ifFalse: [^ self error: ('Expected a directory, got a file named ''class'' in ' , self fileDirectory name)].
	classMethods := self methodsInDirectory: entry asFileDirectory.