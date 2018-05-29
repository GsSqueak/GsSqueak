squeaklets
upLoadProject: projectName members: archiveMembers retry: aBool
	| dir m dirName |
	m := archiveMembers detect:[:any| any fileName includes: $/] ifNone:[nil].
	m == nil ifFalse:[
		dirName := m fileName copyUpTo: $/.
		self createDirectory: dirName.
		dir := self directoryNamed: dirName].
	archiveMembers do:[:entry| | okay idx |
		ProgressNotification signal: '4:uploadingFile'
			extra: ('(uploading {1}...)' translated format: {entry fileName}).
		idx := entry fileName indexOf: $/.
		okay := (idx > 0
			ifTrue:[
				dir putFile: entry contentStream 
					named: (entry fileName copyFrom: idx+1 to: entry fileName size) 
					retry: aBool]
			ifFalse:[
				self putFile: entry contentStream
					named: entry fileName
					retry: aBool]).
		(okay == false
			or: [okay isString])
			ifTrue: [
				self inform: ('Upload for {1} did not succeed ({2}).' translated format: {entry fileName printString. okay}).
				^false].
	].
	ProgressNotification signal: '4:uploadingFile' extra:''.
	^true