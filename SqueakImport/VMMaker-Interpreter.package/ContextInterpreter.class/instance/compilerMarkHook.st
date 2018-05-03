compiler support
compilerMarkHook
	<inline: true>
	compilerInitialized ifTrue: [self compilerMark]