path access
relativeNameIfAbsoluteFor: aFileName
	"Answer either the relative name for aFileName, if aFileName names a file in me or
	 subdirectories, or aFileName's absolute path if it isn't in me or subdirectories.
	 P.S. Ths is what I'd expect relativeNameFor: to do, but it is taken and means
	 exactly the opposite, i.e. the absolute path for a relative name."
	| fullNameSize fullName fileNameSize |
	(aFileName isEmpty or: [aFileName first ~= self driveName first]) ifTrue:
		[self error: 'this method expects an absolute filename'].
	fullNameSize := (fullName := self fullName) size.
	fileNameSize := aFileName size.
	^(aFileName beginsWith: fullName)
		ifTrue: [(fileNameSize = fullNameSize
				or: [fileNameSize - 1 = fullNameSize
					and: [(aFileName at: fileNameSize) = self pathNameDelimiter]])
					ifTrue: [self class currentDirectoryNickname]
					ifFalse: [aFileName copyFrom: fullNameSize + 2 to: fileNameSize]]
		ifFalse: [aFileName]

	"SourceFiles asArray collect: [:sf| FileDirectory default relativeNameIfAbsoluteFor: sf fullName]"
	"FileDirectory default relativeNameIfAbsoluteFor: FileDirectory default fullName" "should be dot"
	"FileDirectory default relativeNameIfAbsoluteFor: FileDirectory default fullName, FileDirectory default slash" "should also be dot"