utilities
buildJumpToMenu: menu
	"Make the supplied menu offer a list of potential projects, consisting of:
		*	The previous-project chain
		*	The next project, if any
		*	The parent project, if any
		*	All projects, alphabetically or hierarchically"

	| prev listed i next |
	listed := OrderedCollection with: self.
	i := 0.

	"The previous Project chain"
	prev := self previousProject.
	[(prev ~~ nil and: [(listed includes: prev) not])] whileTrue:
	  [i := i + 1.
		listed add: prev.
		self 	addItem: prev name , ' (', ('back {1}' translated format:{i}  ), ')'
				toMenu: menu 
				selection: ('%back' , i printString) 
				color: prev color
				thumbnail: prev thumbnail.
		prev := prev previousProject].
	i > 0 ifTrue: [menu addLine].


	"Then the next Project"
	(((next := self nextProject) ~~ nil) and: [(listed includes: next) not]) ifTrue:
		[self	addItem: (next name, ' (', ('forward {1}' translated format:{1}), ')') 
				toMenu: menu 
				selection: next name 
				color: next color
				thumbnail: next thumbnail]. 
	next ~~ nil ifTrue: [menu addLine].

	"Then the parent"
	self isTopProject ifFalse: 
		[self	addItem: self parent name , ' (', 'parent' translated, ')' 
				toMenu: menu 
				selection: #parent 
				color: self parent color
				thumbnail: self parent thumbnail.
		  menu addLine].

	"Finally all the projects, in hierarchical or alphabetical order:"
	(Preferences alphabeticalProjectMenu
			ifTrue:
				[Project allNamesAndProjects]
			ifFalse:
				[Project hierarchyOfNamesAndProjects]) do:

		[:aPair | | toAdd | 
			toAdd := aPair last isCurrentProject
				ifTrue:
				  [aPair first, ' (', 'current' translated, ')']
				ifFalse:
				  [aPair first].
			self	addItem: toAdd 
				toMenu: menu 
				selection: aPair first 
				color: aPair last color
				thumbnail: aPair last thumbnail].
	^ menu