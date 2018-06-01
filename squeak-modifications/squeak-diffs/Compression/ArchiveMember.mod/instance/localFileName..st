accessing
localFileName: aString
	"Set my internal filename.
	Returns the (possibly new) filename.
	aString will be translated from local FS format into Unix format."

	^fileName := aString copyReplaceAll: FileDirectory slash with: '/'.