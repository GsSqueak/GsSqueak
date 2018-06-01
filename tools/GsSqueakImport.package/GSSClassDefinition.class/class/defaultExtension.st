concretization
defaultExtension

	^ self directoryExtensions
		ifEmpty: ['']
		ifNotEmpty: [:extensions | extensions first]