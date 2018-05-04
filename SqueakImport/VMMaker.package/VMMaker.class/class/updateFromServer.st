fetching updates
updateFromServer
	"Update the image by loading all pending updates from the server. Also save local
	copies of the update files if the #updateSavesFile preference is set to true"

	"VMMaker updateFromServer"

	(Smalltalk hasClassNamed: #MCMcmUpdater)
		ifTrue: [ | updater |
			updater := Smalltalk at: #MCMcmUpdater.
			(updater respondsTo: #updateFromRepository:baseName: )
				ifTrue: [ "newer MCMcmUpdater supports multiple update streams per repository"
					updater perform: #updateFromRepository:baseName: withArguments: { 'http://source.squeak.org/VMMaker' . 'update' } ]
				ifFalse: [ "older versions of MCMcmUpdater"
						updater updateFromRepositories: #('http://source.squeak.org/VMMaker') ] ]
		ifFalse: [self notify: 'MonticelloConfigurations not installed in this image']