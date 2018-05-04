initialisation
forConfigurationFile: aFileName
	| config fileStream |

	fileStream := FileStream oldFileNamed: aFileName.
	config := ('#(' includes: fileStream peek) "for storeOn: format"
				ifTrue: [Object readFrom: fileStream]
				ifFalse: [fileStream fileInObjectAndCode].
	^self forConfiguration: config.
