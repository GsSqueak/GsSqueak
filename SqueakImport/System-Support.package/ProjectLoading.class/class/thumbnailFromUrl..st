accessing
thumbnailFromUrl: urlString
	"Load the project, and make a thumbnail to it in the current project.
ProjectLoading thumbnailFromUrl: 'http://www.squeak.org/Squeak2.0/2.7segments/SqueakEasy.extSeg'.
"

	Project canWeLoadAProjectNow ifFalse: [^ self].
	Project current
		do: [| fileName fileAndDir |
			ProgressNotification signal: '1:foundMostRecent'.
			fileName := (urlString findTokens: '/') last.
			fileAndDir := self bestAccessToFileName: fileName andDirectory: urlString.
			self
				openName: fileName 
				stream: fileAndDir first 
				fromDirectory: fileAndDir second
				withProjectView: nil]
		withProgressInfoOn: nil
		label: 'project loading'
