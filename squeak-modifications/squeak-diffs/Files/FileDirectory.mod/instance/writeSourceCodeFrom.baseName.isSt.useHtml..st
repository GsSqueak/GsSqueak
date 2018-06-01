utilities
writeSourceCodeFrom: aStream baseName: baseName isSt: stOrCsFlag useHtml: useHtml
	"Write the source code from aStream into a file.'foo $🖕'"

	| extension  fileName |

	stOrCsFlag ifTrue: [
		extension := (FileDirectory dot, FileStream st).
	] ifFalse: [
		extension := (FileDirectory dot, FileStream cs).
	].
	useHtml ifTrue: [extension := FileDirectory dot, 'html'].
	
	fileName := (self class baseNameFor: baseName) , extension. "oh, for a decent file name system"
	self newFileNamed: fileName do:[:f|
		f nextPutAll: aStream contents]