loading
loadInstanceMethods

	| entry |
	entry := self fileDirectory entryAt: 'instance' ifAbsent: [^ self].
	entry isDirectory ifFalse: [^ self error: ('Expected a directory, got a file named ''instance'' in ' , self fileDirectory name)].
	instanceMethods := self methodsInDirectory: entry asFileDirectory