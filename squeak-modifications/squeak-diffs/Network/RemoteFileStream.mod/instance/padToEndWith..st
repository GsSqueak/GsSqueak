as yet unclassified
padToEndWith: aChar
	"On the Mac, files do not truncate, so pad it with a harmless character.  But Remote FTP files always replace, so no need to pad."

	self atEnd ifFalse: [self inform: 'Why is this stream not at its end?'].