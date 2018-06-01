private
getPostArgsFromProject: aProject fileNamed: fileNameString fromDirectory: localDirectory 
	| args thumbnail uploader |
	args := Dictionary new.

	"args at: 'contents' put: {(localDirectory oldFileNamed: fileNameString) contentsOfEntireFile}."
	args at: 'contents' put: {(StandardFileStream
			readOnlyFileNamed: (localDirectory fullNameFor: fileNameString)) contentsOfEntireFile}.

	args at: 'name' put: {aProject name isoToSqueak}.
	args at: 'version' put: {(Project parseProjectFileName: fileNameString) second asString}.
	args at: 'language' put: {aProject naturalLanguage asString}.

	uploader := Utilities authorNamePerSe.
	uploader isEmptyOrNil
		ifTrue: [uploader := Utilities authorInitialsPerSe].
	uploader isEmptyOrNil
		ifFalse: [args at: 'uploader' put: {uploader}].

	self putSmalltalkInfoInto: args.

	thumbnail := self getProjectThumbnail: aProject.
	thumbnail isNil
		ifFalse: [args at: 'thumbnailcontents' put: {thumbnail}].

	self putProjectDetailsFrom: aProject to: args.

	^ args