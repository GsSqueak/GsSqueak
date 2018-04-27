accessing
removeEmptyCategories
	"Remove empty categories."

	| categoryIndex currentStop keptCategories keptStops |
	keptCategories := WriteStream on: (Array new: 16).
	keptStops := WriteStream on: (Array new: 16).
	currentStop := categoryIndex := 0.
	[(categoryIndex := categoryIndex + 1) <= categoryArray size]
		whileTrue: 
			[(categoryStops at: categoryIndex) > currentStop
				ifTrue: 
					[keptCategories nextPut: (categoryArray at: categoryIndex).
					keptStops nextPut: (currentStop := categoryStops at: categoryIndex)]].
	categoryArray := keptCategories contents.
	categoryStops := keptStops contents.
	categoryArray size = 0
		ifTrue:
			[categoryArray := Array with: Default.
			categoryStops := Array with: 0]

	"ClassOrganizer allInstancesDo: [:co | co removeEmptyCategories]."