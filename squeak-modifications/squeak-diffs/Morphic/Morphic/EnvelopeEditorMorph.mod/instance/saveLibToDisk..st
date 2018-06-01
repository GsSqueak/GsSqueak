menu
saveLibToDisk: evt 
	"Save the library to disk"
	| newName |
	newName := UIManager default saveFilenameRequest: 'Please confirm name for library...' initialAnswer: 'MySounds.fml'.
	newName ifNil: [^ self].

	FileStream newFileNamed: newName
		do: [:f | AbstractSound soundNames
				do: [:name | | snd |
					snd := AbstractSound soundNamed: name.
					f nextChunkPut: 'AbstractSound soundNamed: ' , name , ' put: ' , snd storeString;
						cr;
						cr]]