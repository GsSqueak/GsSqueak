*SqClasses-*SqClasses-*SqClasses-image, changes names
sourcesName
	"Answer the full path to the version-stable source code if it exists, otherwise the desired location"
	^ self locateSourcesEntry
		ifNil: [ self vmPath , SourceFileVersionString , FileDirectory dot , 'sources' ]
		ifNotNil: [ : entry | entry fullName ]
