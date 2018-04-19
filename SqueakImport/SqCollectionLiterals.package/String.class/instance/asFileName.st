*SqCollectionLiterals-*SqCollectionLiterals-converting
asFileName
	"Answer a String made up from the receiver that is an acceptable file base
	name. Does not produce corrected fulll paths if the directory separator etc are included"

	| string checkedString |
	string := FileDirectory checkName: self fixErrors: true.
	checkedString := (FilePath pathName: string) asVmPathName.
	^ (FilePath pathName: checkedString isEncoded: true) asSqueakPathName.
