fileout
fileoutComment

	self deleteFileNamed: 'README.md'.
	comment ifNotNil: [
			self save: 'README.md' contents: comment].