initialize-release
initialFilename: aFilenameOrNil
	"Set the initial choice of filename to highlight.
	We split the potential filename to see if it includes a path and if so, use that as the chosen directory - the client can manually change that with a subsequent send of #directory: if wanted.
	We split the root filename to find an extension and use that as the suffix - again, the client can manually change that later"

	| e f p |
	aFilenameOrNil ifNil:[^self].
	
	p := FileDirectory dirPathFor: aFilenameOrNil.
	p isEmpty ifFalse:[self directory: (FileDirectory on: p)].	
	f := FileDirectory localNameFor: aFilenameOrNil.
	fileName := f.
	e := FileDirectory extensionFor: f.
	e isEmpty ifFalse:[self suffix: e]