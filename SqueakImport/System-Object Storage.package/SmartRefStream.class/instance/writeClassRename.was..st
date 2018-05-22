class changed shape
writeClassRename: newName was: oldName
	"Write a method that tells which modern class to map instances to."
	| oldVer sel code |

	oldVer := self versionSymbol: (structures at: oldName).
	sel := oldName asString.
	sel at: 1 put: (sel at: 1) asLowercase.
	sel := sel, oldVer.	"i.e. #rectangleoc4"

	code := WriteStream on: (String new: 500).
	code nextPutAll: sel; cr.
	code cr; tab; nextPutAll: '^ ', newName.	"Return new class"

	self class compile: code contents classified: 'conversion'.

