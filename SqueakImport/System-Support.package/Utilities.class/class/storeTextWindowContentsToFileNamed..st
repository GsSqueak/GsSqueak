miscellaneous
storeTextWindowContentsToFileNamed: aName
	"Utilities storeTextWindowContentsToFileNamed: 'TextWindows'"
	| aDict aRefStream |

	aDict := Project current textWindows..
	aDict size = 0 ifTrue: [^ self inform: 'no windows found to export.'].
	aRefStream := ReferenceStream fileNamed: aName.
	aRefStream nextPut: aDict.
	aRefStream close.
	self inform: 'Done!  ', aDict size printString, ' window(s) exported.'