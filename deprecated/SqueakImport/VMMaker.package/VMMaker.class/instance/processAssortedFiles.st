processing external files
processAssortedFiles
	"Here is where we get a chance to process any files needed as part of the make process; instructions, makefile fragments, resources etc.
	The default is to copy any miscellaneous files/dirs from the cross-platformDirectory/misc/ToCopy, then from the platform specific directory/misc/ToCopy. You can put any tree structure you like under misc/ToCopy, should that be important to you."
	| srcDir |
	"Is there a crossPlatformDirectory subdirectory called 'misc'?"
	(self crossPlatformDirectory directoryExists: 'misc')
		ifTrue: [srcDir := self crossPlatformDirectory directoryNamed: 'misc'.
			"Is there a subdirectory called 'ToCopy' ?"
			(srcDir directoryExists: 'ToCopy') ifTrue:[
				srcDir := srcDir directoryNamed: 'ToCopy'.
				self copyFilesFromSourceDirectory: srcDir toTargetDirectory: self sourceDirectory]].
	"Is there a platformDirectory subdirectory called 'misc'?"
	(self platformDirectory directoryExists: 'misc')
		ifTrue: [srcDir := self platformDirectory directoryNamed: 'misc'.
			"Is there a subdirectory called 'ToCopy' ?"
			(srcDir directoryExists: 'ToCopy') ifTrue:[
				srcDir := srcDir directoryNamed: 'ToCopy'.
				self copyFilesFromSourceDirectory: srcDir toTargetDirectory: self sourceDirectory]]