private
sortBlock
	"Answer block to decide what order to display the directory entries."
	^ [:x :y | x isDirectory = y isDirectory
		ifTrue: ["sort by user-specified criterion"
			sortMode = #name
				ifTrue: [(x name compare: y name)
						<= 2]
				ifFalse: [sortMode = #date
						ifTrue: [x modificationTime = y modificationTime
								ifTrue: [(x name compare: y name)
										<= 2]
								ifFalse: [x modificationTime > y modificationTime]]
						ifFalse: ["size"
							x fileSize = y fileSize
								ifTrue: [(x name compare: y name)
										<= 2]
								ifFalse: [x fileSize > y fileSize]]]]
		ifFalse: ["directories always precede files"
			x isDirectory]]