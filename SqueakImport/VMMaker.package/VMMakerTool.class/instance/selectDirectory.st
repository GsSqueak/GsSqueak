path access
selectDirectory
	"Newer images should use UIManager, but UIManager is not available on
	older images. Provide backward compatibility."

	(Smalltalk hasClassNamed: #UIManager)
		ifTrue: [^(Smalltalk at: #UIManager) default perform: #chooseDirectory]
		ifFalse: [^(Smalltalk at: #FileList2) perform: #modalFolderSelector].
	self error: 'directory selector dialog not available'