halo commands
organizeIntoRow
	"Place my objects in a row-enforcing container"

	((AlignmentMorph inARow: (selectedItems sorted: [:x :y | x left < y left])) setNameTo: 'Row'; color: Color orange muchLighter; enableDragNDrop: true; yourself) openInHand
