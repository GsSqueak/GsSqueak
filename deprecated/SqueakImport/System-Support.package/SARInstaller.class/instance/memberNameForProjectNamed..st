client services
memberNameForProjectNamed: projectName
	"Answer my member name for the given project, or nil.
	Ignores version numbers and suffixes, and also unescapes percents in filenames."

	^self zip memberNames detect: [ :memberName | | triple |
		triple := Project parseProjectFileName: memberName unescapePercents.
		triple first asLowercase = projectName asLowercase
	] ifNone: [ nil ].