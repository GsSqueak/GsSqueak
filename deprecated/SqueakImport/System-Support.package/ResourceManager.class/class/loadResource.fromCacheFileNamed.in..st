private-resources
loadResource: urlString fromCacheFileNamed: fileName in: dir
	| archiveName file archive |
	(fileName beginsWith: 'zip://') ifTrue:[
		archiveName := fileName copyFrom: 7 to: fileName size.
		archive := [dir readOnlyFileNamed: archiveName] 
			on: FileDoesNotExistException
			do:[:ex| ex return: nil].
		archive ifNil:[^nil].
		archive isZipArchive ifTrue:[
			archive := ZipArchive new readFrom: archive.
			file := archive members detect:[:any| any fileName = urlString] ifNone:[nil]].
		file ifNotNil:[file := file contentStream].
		archive close.
	] ifFalse:[
		file := [dir readOnlyFileNamed: fileName] 
				on: FileDoesNotExistException
				do:[:ex| ex return: nil].
	].
	^file