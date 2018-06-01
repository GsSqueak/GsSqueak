utilities
signFile: fileName renameAs: destFile key: privateKey dsa: dsa
	"Sign the given file using the private key."
	| in out |
	in := FileStream readOnlyFileNamed: fileName.	in binary.
	out := FileStream newFileNamed: destFile.			out binary.
	[in atEnd] whileFalse:[out nextPutAll: (in next: 4096)].
	in close.	out close.
	FileDirectory activeDirectoryClass splitName: destFile to:[:path :file|
		SecurityManager default signFile: file directory: (FileDirectory on: path).
	].
