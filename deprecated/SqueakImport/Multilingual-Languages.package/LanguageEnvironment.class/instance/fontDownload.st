fonts support
fontDownload
	"(Locale isoLanguage: 'ja') languageEnvironment fontDownload"
	
	(FileDirectory default fileExists: self fontFullName)
		ifTrue: [^ self].
	Cursor read
		showWhile: [self fontDownloadUrls
				do: [:each | [ | contents f |
					contents := (each , '/' , self fontFileName) asUrl retrieveContents contents.
					(contents first: 2)
							= 'PK'
						ifTrue: [f := FileStream newFileNamed: self fontFullName.
							f binary.
							[f nextPutAll: contents]
								ensure: [f close].
							^ self]]
						on: NameLookupFailure
						do: [:e | e]]].
	self error: 'Fonts does not found (' , self fontFullName , ')'