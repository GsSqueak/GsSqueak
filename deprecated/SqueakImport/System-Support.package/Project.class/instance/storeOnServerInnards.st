file in/out
storeOnServerInnards
	"Save to disk as an Export Segment.  Then put that file on the server I came from, as a new version.  Version is literal piece of file name.  Mime encoded and http encoded."

	| resp newName primaryServerDirectory serverVersionPair localDirectory localVersionPair myVersionNumber warning maxNumber suppliedPassword oldResourceUrl |
	self assureIntegerVersion.

	"Find out what version"
	primaryServerDirectory := self primaryServerIfNil: [
		(primaryServerDirectory := self findAFolderToStoreProjectIn) ifNil: [^self].
		oldResourceUrl := self resourceUrl.
		primaryServerDirectory == #localOnly ifTrue: [
			self storeNewPrimaryURL: FileDirectory default url.
			nil
		] ifFalse: [
			self storeNewPrimaryURL: primaryServerDirectory downloadUrl.
			primaryServerDirectory
		].
	].

	localDirectory := self squeakletDirectory.
	serverVersionPair := self class mostRecent: self name onServer: primaryServerDirectory.
	localVersionPair := self class mostRecent: self name onServer: localDirectory.
	maxNumber := myVersionNumber := self currentVersionNumber.

	ProgressNotification signal: '2:versionsDetected'.

	warning := ''.
	myVersionNumber < serverVersionPair second ifTrue: [
		warning := warning,'\There are newer version(s) on the server' translated.
		maxNumber := maxNumber max: serverVersionPair second.
	].
	myVersionNumber < localVersionPair second ifTrue: [
		warning := warning,'\There are newer version(s) in the local directory' translated.
		maxNumber := maxNumber max: localVersionPair second.
	].
	"8 Nov 2000 - only check on the first attempt to publish"
	myVersionNumber = 0 ifTrue: [
		warning isEmpty ifFalse: [
			myVersionNumber = 0 ifTrue: [
				warning := warning,'\THIS PROJECT HAS NEVER BEEN SAVED' translated.
			].
			warning := 'WARNING' translated, '\Project: ' translated, self name,warning.
			resp := (UIManager default 
					chooseFrom: (Array with: 'Store anyway' translated 
										with: 'Cancel' translated)
  					title: (warning, '\Please cancel, rename this project, and see what is there.' translated) withCRs).
				resp ~= 1 ifTrue: [^ nil]
		].
	].
	version := self bumpVersion: maxNumber.

	oldResourceUrl
		ifNotNil: [self resourceManager adjustToNewServer: self resourceUrl from: oldResourceUrl].

	"write locally - now zipped automatically"
	newName := self versionedFileName.
	lastSavedAtSeconds := Time totalSeconds.
	self exportSegmentFileName: newName directory: localDirectory.
	(localDirectory readOnlyFileNamed: newName) setFileTypeToObject; close.

	ProgressNotification signal: '4:localSaveComplete'.	"3 is deep in export logic"

	primaryServerDirectory ifNotNil: [
		suppliedPassword := ''.
		Preferences passwordsOnPublish ifTrue: [
			suppliedPassword := UIManager default requestPassword: 'Project password' translated
		].
		[
		primaryServerDirectory
			writeProject: self
			inFileNamed: newName asFileName
			fromDirectory: localDirectory.
		] on: ProjectPasswordNotification do: [ :ex |
			ex resume: (suppliedPassword ifNil: [''])
		].
	].
	ProgressNotification signal: '9999 save complete'.

	"Later, store with same name on secondary servers.  Still can be race conditions.  All machines will go through the server list in the same order."
	"2 to: servers size do: [:aServer | aServer putFile: local named: newName]."
