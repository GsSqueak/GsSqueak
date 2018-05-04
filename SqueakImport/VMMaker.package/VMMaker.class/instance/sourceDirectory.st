target directories
sourceDirectory
	| fd |
	fd := FileDirectory default
				directoryNamed: (sourceDirName
						ifNil: [self class sourceDirName]).
	fd assureExistence.
	^ fd