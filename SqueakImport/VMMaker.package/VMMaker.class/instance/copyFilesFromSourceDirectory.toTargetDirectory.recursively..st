private - copying files
copyFilesFromSourceDirectory: srcDir toTargetDirectory: dstDir recursively: recurseBoolean
	"copy all files and subdirectories from srcDir to dstDir, optionally recursing down the tree.
	It is assumed that both directories already exist and have appropriate 
	permissions - proper error handling ought to be provided sometime. 
	Note how nice it would be if the file system classes already did this; 
	why, they could even defer to an improved file plugin for some of 
	these things."
	"copy all the files"
	| dirList  |
	srcDir localName = 'CVS' ifTrue:[logger show: 'CVS files NOT copied by VMMaker'; cr. ^self].
	srcDir localName = '.svn' ifTrue:[logger show: 'SVN files NOT copied by VMMaker'; cr. ^self].

	self copyFilesFrom: srcDir to: dstDir.

	recurseBoolean ifFalse:[^self].
	"If we are recursing create the subdirectories of srcDir in dstDir, and then copy that 
	subtree "
	dirList := srcDir directoryNames copyWithout: 'CVS'.
	dirList := srcDir directoryNames copyWithout: '.svn'.
	dirList do: 
		[:newDstDir | 
		(dstDir directoryExists: newDstDir)
			ifFalse: [dstDir createDirectory: newDstDir].
		self copyFilesFromSourceDirectory: (srcDir directoryNamed: newDstDir)
			toTargetDirectory: (dstDir directoryNamed: newDstDir)
			recursively: true]