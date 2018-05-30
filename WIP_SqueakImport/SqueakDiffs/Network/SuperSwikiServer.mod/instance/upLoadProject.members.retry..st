squeaklets
upLoadProject: projectName members: archiveMembers retry: aBool
	
	archiveMembers do:[:entry| | answer |
		ProgressNotification signal: '4:uploadingFile' extra:'(uploading ' translated, entry fileName convertFromSystemString , '...)' translated.
		answer := self sendToSwikiProjectServer: {
			'uploadproject2: ', entry fileName convertFromSystemString convertToEncoding: self encodingName.
			'password: ',ProjectPasswordNotification signal.
			entry contents.
		}.
		answer = 'OK' ifFalse:[
			self inform:'Server responded ' translated, answer.
			^false].
	].
	ProgressNotification signal: '4:uploadingFile' extra:''.
	^true