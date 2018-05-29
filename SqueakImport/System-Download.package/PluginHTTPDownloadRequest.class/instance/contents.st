accessing
contents
	| |
	semaphore wait.
	(content isNil and:[fileStream notNil]) ifTrue:[
"		pos := fileStream position."
		fileStream position: 0.
		content := MIMEDocument content: fileStream upToEnd.
		fileStream close.
	].
	^content