compiler support
compilerPostGCHook
	<inline: true>
	compilerInitialized ifTrue: [self compilerPostGC]