menu
buildThreadOfProjects

	| projectNames threadName |

	projectNames := pages collect: [ :each | | thisPVM |
		(thisPVM := each findA: ProjectViewMorph) ifNil: [
			nil
		] ifNotNil: [
			{thisPVM project name}.
		].
	].
	projectNames := projectNames reject: [ :each | each isNil].
	threadName := UIManager default 
		request: 'Please name this thread.' translated 
		initialAnswer: (
			self valueOfProperty: #nameOfThreadOfProjects ifAbsent: ['Projects on Parade' translated]
		).
	threadName isEmptyOrNil ifTrue: [^self].
	InternalThreadNavigationMorph 
		know: projectNames as: threadName;
		openThreadNamed: threadName atIndex: nil.
