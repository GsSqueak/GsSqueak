subprojects
subProjects
	"Answer a list of all the subprojects  of the receiver. "
	
	self flag: #fix. "mt: Collect other projects that have this as parent. See Project >> #allProjects"
	^world submorphs 
		select: [:m | (m isSystemWindow) and: [m model isKindOf: Project]]
		thenCollect: [:m | m model].