multipart
save
	"save the part to a file"
	| fileName |
	fileName := self name ifNil: ['attachment' , Utilities dateTimeSuffix].
	(fileName includes: $.)
		ifFalse: [#(#isJpeg 'jpg' #isGif 'gif' #isPng 'png' #isPnm 'pnm')
				pairsDo: [:s :e | (self body perform: s)
						ifTrue: [fileName := fileName , FileDirectory dot , e]]].

	fileName := UIManager default saveFilenameRequest: 'File name for save?' initialAnswer: fileName.
	fileName ifNil: [^ nil].

	FileStream newFileNamed: fileName
		do: [:file | file nextPutAll: self bodyText]