example
example
	"MenuMorph example popUpInWorld"

	| menu |
	menu := MenuMorph new.
	menu addTitle: 'Fruit' translated.
	menu addStayUpItem.
	menu add: 'apples' action: #apples.
	menu add: 'oranges' action: #oranges.
	menu addLine.
	menu addLine.  "extra lines ignored"
	menu add: 'peaches' action: #peaches.
	menu addLine.
	menu add: 'pears' action: #pears.
	menu addLine.
	^ menu
