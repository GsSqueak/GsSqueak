client services
fileInProjectNamed: projectOrMemberName createView: aBoolean 
	"This is to be used from preamble/postscript code to file in SAR members 
	as Projects. 
	Answers the loaded project, or nil. 
	Does not enter the loaded project. 
	If aBoolean is true, also creates a ProjectViewMorph 
	(possibly in a window, depending on your Preferences)."
	| member project triple memberName |
	member := self memberNamed: projectOrMemberName.
	member
		ifNotNil: [ memberName := member fileName ]
		ifNil: [ 	member := self memberNamed: (memberName := self memberNameForProjectNamed: projectOrMemberName) ].
	member ifNil: [ ^self errorNoSuchMember: projectOrMemberName ].
	triple := Project parseProjectFileName: memberName unescapePercents.
	project := nil.
	[[ProjectLoading
		openName: triple first
		stream: member contentStream
		fromDirectory: nil
		withProjectView: nil]
		on: ProjectViewOpenNotification
		do: [:ex | ex resume: aBoolean]]
		on: ProjectEntryNotification
		do: [:ex | 
			project := ex projectToEnter.
			ex resume].
	self installed: member.
	^ project