compiler support
compilerProcessChangeHook
	<inline: true>
	compilerInitialized ifTrue: [self compilerProcessChange]