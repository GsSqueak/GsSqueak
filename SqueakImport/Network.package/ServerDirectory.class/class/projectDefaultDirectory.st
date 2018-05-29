school support
projectDefaultDirectory
	^Preferences eToyLoginEnabled
		ifTrue: [
			(ServerDirectory localProjectDirectories, ServerDirectory servers values)
						detect:[:any| any hasEToyUserList]
						ifNone:[FileDirectory default]]
		ifFalse: [FileDirectory default]