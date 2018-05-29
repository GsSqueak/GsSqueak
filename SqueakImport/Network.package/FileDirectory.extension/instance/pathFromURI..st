*network-uri
pathFromURI: aString
	| path |
	aString class == Array ifTrue:["bullet-proofing"
		^FileDirectory pathFrom: {self pathName}, aString].
	"To support paths like foo/bar/user#2.doc, use #allButScheme instead of #path"
	path := (self uri resolveRelativeURI: aString) allButScheme.
	^self uriPathToPlatformPath: path
