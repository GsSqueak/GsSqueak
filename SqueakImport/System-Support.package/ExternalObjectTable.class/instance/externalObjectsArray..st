private
externalObjectsArray: anArray
	"Update the index mapping using anArray as the new externalObjectsArray."

	externalObjectsArray := anArray.
	freeSlotIndexes reset.
	indexesByObjects removeAll.
	1 to: externalObjectsArray size do: [ :index |
		(anArray at: index) 
			ifNil: [ freeSlotIndexes addFirst: index ]
			ifNotNil: [ :object | indexesByObjects at: object put: index ] ]