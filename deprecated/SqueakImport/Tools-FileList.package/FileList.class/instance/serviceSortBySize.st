own services
serviceSortBySize
	"Answer a service for sorting by size"

	^  (SimpleServiceEntry 
			provider: self 
			label: 'by size' translatedNoop
			selector: #sortBySize
			description: 'sort entries by size' translatedNoop)
				extraSelector: #sortingBySize;
				buttonLabel: 'size' translatedNoop