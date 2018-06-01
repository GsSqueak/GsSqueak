file name utilities
nextNameFor: baseFileName extension: extension
	"Assumes a file name includes a version number encoded as '.' followed by digits 
	preceding the file extension.  Increment the version number and answer the new file name.
	If a version number is not found, set the version to 1 and answer a new file name"

	| files splits version |

	files := self fileNamesMatching: (baseFileName,'*', self class dot, extension).
	splits := files 
			collect: [:file | self splitNameVersionExtensionFor: file]
			thenSelect:
					[:split |
					 self isCaseSensitive 
						ifTrue:[(split at: 1) = baseFileName]
						ifFalse:[(split at: 1) match: baseFileName]].
	version := splits isEmpty 
				ifTrue: [1]
				ifFalse: [((splits detectMax: [ :each | each at: 2 ]) at: 2) + 1].
	^ (baseFileName, '.', version asString, self class dot, extension) asFileName