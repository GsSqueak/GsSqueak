drawing
drawOn: aCanvas

	| topRow bottomRow |
	listItems ifEmpty: [ ^self ].
	
	self drawPreSelectionOn: aCanvas.
	
	topRow := self topVisibleRowForCanvas: aCanvas.
	bottomRow := self bottomVisibleRowForCanvas: aCanvas.

	"Draw multi-selection."
	topRow to: bottomRow do: [ :row |
		(listSource itemSelectedAmongMultiple: row) ifTrue: [
			self drawBackgroundForMulti: row on: aCanvas ] ].
	self drawSelectionOn: aCanvas.

	"Draw hovered row if preference enabled."
	PluggableListMorph highlightHoveredRow ifTrue: [
		listSource hoverRow > 0 ifTrue: [
			self highlightHoverRow: listSource hoverRow on: aCanvas ] ].

	"Draw all visible rows."
	topRow to: bottomRow do: [ :row |
		self display: (self item: row) atRow: row on: aCanvas ].

	"Finally, highlight drop row for drag/drop operations.."
	listSource potentialDropRow > 0 ifTrue: [
		self highlightPotentialDropRow: listSource potentialDropRow on: aCanvas ].