compiler support
compilerPostSnapshotHook
	<inline: true>
	compilerInitialized ifTrue: [self compilerPostSnapshot]