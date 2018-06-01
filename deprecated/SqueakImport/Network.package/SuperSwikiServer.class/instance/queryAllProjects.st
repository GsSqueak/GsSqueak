testing
queryAllProjects

"answer a collection of DirectoryEntry objects for each file on server"

"SuperSwikiServer testOnlySuperSwiki queryAllProjects"

	^self sendToSwikiProjectServer: {
		'action: listallprojects'.
	}