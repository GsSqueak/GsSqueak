squeaklets
upLoadProject: projectFile named: fileNameOnServer resourceUrl: resUrl retry: aBool
	"Upload the given project file. If it's an archive, upload only the files that are local to the project."
	| archive members prefix |
	self isTypeFile ifTrue:[
 		^(FileDirectory on: urlObject pathForDirectory)
			upLoadProject: projectFile named: fileNameOnServer resourceUrl: resUrl retry: aBool].
	projectFile isZipArchive
		ifFalse:[^self putFile: projectFile named: fileNameOnServer retry: aBool].
	projectFile binary.
	archive := ZipArchive new readFrom: projectFile.
	resUrl last = $/ 
		ifTrue:[prefix := resUrl copyFrom: 1 to: resUrl size-1] "remove last slash"
		ifFalse:[prefix := resUrl].
	prefix := prefix copyFrom: 1 to: (prefix lastIndexOf: $/).
	members := archive members select:[:entry| | upload |
		"figure out where it's coming from"
		upload := false.
		(entry fileName indexOf: $:) = 0 ifTrue:[
			upload := true. "one of the core files, e.g., project itself, resource map, meta info"
		] ifFalse:[
			(entry fileName asLowercase beginsWith: resUrl asLowercase) ifTrue:[
				upload := true.
				entry fileName: (entry fileName copyFrom: prefix size+1 to: entry fileName size).
			].
		].
		upload].
	members := members asArray sort:[:m1 :m2| m1 compressedSize < m2 compressedSize].
	^self upLoadProject: fileNameOnServer members: members retry: aBool.