active process
depth
	"Return the depth of this project from the top.
	 topProject = 0, next = 1, etc."
	"Project current depth."

	| depth project |
	depth := 0.
	project := self.
	
	[project class == DiskProxy ifTrue: [^ depth].
	 project isTopProject]
		whileFalse:
			[project := project parent.
			depth := depth + 1].
	^ depth