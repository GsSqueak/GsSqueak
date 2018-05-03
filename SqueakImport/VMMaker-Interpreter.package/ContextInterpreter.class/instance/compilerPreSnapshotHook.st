compiler support
compilerPreSnapshotHook
	<inline: true>
	compilerInitialized ifTrue: [self compilerPreSnapshot]