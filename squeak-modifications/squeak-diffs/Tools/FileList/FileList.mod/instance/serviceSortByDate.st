own services
serviceSortByDate
	"Answer a service for sorting by date"

	^  (SimpleServiceEntry new
			provider: self 
			label: 'by date' translatedNoop 
			selector: #sortByDate 
			description: 'sort entries by date' translatedNoop)
		extraSelector: #sortingByDate;
		buttonLabel: 'date' translatedNoop