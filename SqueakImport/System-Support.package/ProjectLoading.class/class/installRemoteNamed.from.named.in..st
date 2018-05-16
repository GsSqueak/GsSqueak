loading
installRemoteNamed: remoteFileName from: aServer named: otherProjectName in: currentProject

	| fileAndDir |

	"Find the current ProjectViewMorph, fetch the project, install in ProjectViewMorph without changing size, and jump into new project."

	ProgressNotification signal: '1:foundMostRecent'.
	fileAndDir := self bestAccessToFileName: remoteFileName andDirectory: aServer.
	^self 
		openName: remoteFileName 
		stream: fileAndDir first 
		fromDirectory: fileAndDir second
		withProjectView: (currentProject findProjectView: otherProjectName).
