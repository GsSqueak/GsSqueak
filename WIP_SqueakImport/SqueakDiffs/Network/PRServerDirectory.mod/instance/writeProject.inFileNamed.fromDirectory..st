squeaklets
writeProject: aProject inFileNamed: fileNameString fromDirectory: localDirectory 
	"write aProject (a file version can be found in the file named  
	fileNameString in localDirectory)"
	| url arguments string |
	url := self urlFromServer: self server directories: {'programmatic'. 'uploadproject'}.
	arguments := self
				getPostArgsFromProject: aProject
				fileNamed: fileNameString
				fromDirectory: localDirectory.
	""
	string := Cursor read showWhile: [
			(HTTPClient httpPostDocument: url args: arguments) contents
			"(HTTPSocket httpGetDocument: url args: arguments) contents."].
	(string beginsWith: '--OK--')
		ifTrue: [^ true].
	""
	self
		inform: ('Server responded: {1}' translated format: {string}).
	^ false