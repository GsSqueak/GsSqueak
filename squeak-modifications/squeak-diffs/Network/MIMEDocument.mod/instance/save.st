interactions
save
	"save the part to a file"
	| fileName file |
	fileName := self name
				ifNil: ['attachment' , Utilities dateTimeSuffix].
	(fileName includes: $.) ifFalse: [
		#(isJpeg 'jpg' isGif 'gif' isPng 'png' isPnm 'pnm') pairsDo: [ :s :e |
			(self perform: s) ifTrue: [fileName := fileName, '.', e]
		]
	].
	fileName := UIManager default request: 'File name for save?' initialAnswer: fileName.
	fileName isEmpty
		ifTrue: [^ nil].
		
	
	file := FileStream newFileNamed: fileName.
	self contentTransferEncoding = 'base64' ifTrue: [file binary].
	file nextPutAll: self contents.
	file close