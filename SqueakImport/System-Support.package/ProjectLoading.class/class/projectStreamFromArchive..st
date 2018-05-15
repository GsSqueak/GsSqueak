accessing
projectStreamFromArchive: archive
	| ext prFiles entry unzipped |
	ext := FileDirectory dot, Project projectExtension.
	prFiles := archive members select:[:any| any fileName endsWith: ext].
	prFiles isEmpty ifTrue:
		[ext := FileDirectory dot, 'sexp'.
		prFiles := archive members select:[:any| any fileName endsWith: ext]].
	prFiles isEmpty ifTrue: [''].
	entry := prFiles first.
	unzipped := MultiByteBinaryOrTextStream on: (ByteArray new: entry uncompressedSize).
	entry extractTo: unzipped.
	^unzipped reset