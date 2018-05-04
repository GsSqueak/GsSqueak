private - copying files
copyFilesFromSourceDirectory: srcDir toTargetDirectory: dstDir 
	"copy all the files and directories from srcDir to dstDir, recursively"	
	self copyFilesFromSourceDirectory: srcDir
			toTargetDirectory: dstDir
			recursively: true