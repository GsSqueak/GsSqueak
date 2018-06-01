squeaklets
writeProject: aProject inFileNamed: fileNameString fromDirectory: localDirectory 
	"write aProject (a file version can be found in the file named fileNameString in localDirectory)"
	aProject
		writeFileNamed: fileNameString
		fromDirectory: localDirectory
		toServer: self