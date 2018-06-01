loading
openName: aFileName stream: preStream fromDirectory: aDirectoryOrNil
withProjectView: existingView clearOriginFlag: clearOriginFlag
	"Reconstitute a Morph from the selected file, presumed to
represent a Morph saved via the SmartRefStream mechanism, and open it
in an appropriate Morphic world."

   	| morphOrList archive mgr substituteFont numberOfFontSubstitutes resultArray anObject project manifests dict |
	(self checkStream: preStream) ifTrue: [^ self].
	ProgressNotification signal: '0.2'.
	archive := preStream isZipArchive
		ifTrue:[ZipArchive new readFrom: preStream]
		ifFalse:[nil].
	archive ifNotNil:[
	manifests := (archive membersMatching: '*manifest').
	(manifests size = 1 and: [((dict := self parseManifest: manifests first contents) at: 'Project-Format' ifAbsent: []) = 'S-Expression'])
		ifTrue: [
			^ (self respondsTo: #openSexpProjectDict:stream:fromDirectory:withProjectView:)
				ifTrue: [self openSexpProjectDict: dict stream: preStream fromDirectory: aDirectoryOrNil withProjectView: existingView]
				ifFalse: [self inform: 'Cannot load S-Expression format projects without Etoys' translated]]].

	morphOrList := self morphOrList: aFileName stream: preStream fromDirectory: aDirectoryOrNil archive: archive.
	morphOrList ifNil: [^ self].
	ProgressNotification  signal: '0.4'.
	resultArray := self fileInName: aFileName archive: archive morphOrList: morphOrList.
	anObject := resultArray first.
	numberOfFontSubstitutes := resultArray second.
	substituteFont := resultArray third.
	mgr := resultArray fourth.
	preStream close.
	ProgressNotification  signal: '0.7'.
		"the hard part is over"
	(anObject isKindOf: ImageSegment) ifTrue: [
		project := self loadImageSegment: anObject
			fromDirectory: aDirectoryOrNil
			withProjectView: existingView
			numberOfFontSubstitutes: numberOfFontSubstitutes
			substituteFont: substituteFont
			mgr: mgr.
		project noteManifestDetailsIn: dict.
		project removeParameter: #sugarProperties.
		Smalltalk at: #SugarPropertiesNotification ifPresent: [:sp |
			sp signal ifNotNil: [:props | 
				project keepSugarProperties: props monitor: true]].
		clearOriginFlag ifTrue: [project forgetExistingURL].
		ProgressNotification  signal: '0.8'.
			^ project
				ifNil: [self inform: 'No project found in this file' translated]
				ifNotNil: [ProjectEntryNotification signal: project]].
	Project current openViewAndEnter: anObject