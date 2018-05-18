file name utilities
lastNameFor: baseFileName extension: extension
	"Assumes a file name includes a version number encoded as '.' followed by digits 
	preceding the file extension.  Increment the version number and answer the new file name.
	If a version number is not found, set the version to 1 and answer a new file name"

	| files splits |

	files := self fileNamesMatching: (baseFileName,'*', self class dot, extension).
	splits := files 
			collect: [:file | self splitNameVersionExtensionFor: file]
			thenSelect: [:split | (split at: 1) = baseFileName].
	splits isEmpty ifTrue: [ ^nil ].
	^(baseFileName, '.', ((splits detectMax: [ :each | each at: 2]) at: 2) asString, self class dot, extension) asFileName