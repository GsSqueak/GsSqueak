menu
addChangeSidesMenuItems: aCustomMenu hand: aHandMorph 
	"Menu items to change number of sides."
	aCustomMenu addLine.
	aCustomMenu add: 'more sides' translated action: #moreVertices.
	aCustomMenu add: 'fewer sides' translated action: #lessVertices.
"	Regular polygons can be simulated with the one of the skip stars 
	and it would confuse users to have stars be limited to Regular polygons.
	So we've removed those menu items - wiz"
"	aCustomMenu add: 'one more side' translated action: #oneMoreVertex.
	aCustomMenu add: 'one fewer side' translated action: #oneLessVertex"