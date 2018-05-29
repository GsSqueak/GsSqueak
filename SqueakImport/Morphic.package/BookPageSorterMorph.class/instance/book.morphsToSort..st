as yet unclassified
book: aBookMorph morphsToSort: morphList

	| innerBounds scrollPane newHeight |
	book := aBookMorph.
	newHeight := self currentWorld height.
	pageHolder removeAllMorphs.
	pageHolder addAllMorphs: morphList.
	pageHolder extent: pageHolder width@pageHolder fullBounds height.
	innerBounds := Rectangle merging: (morphList collect: [:m | m bounds]).
	pageHolder extent: innerBounds extent + pageHolder borderWidth + 6.
	(pageHolder height > newHeight) ifTrue: [
		scrollPane := ScrollPane new.

		self height: newHeight.
		scrollPane model: pageHolder.
		scrollPane extent: pageHolder width@(newHeight - aBookMorph submorphs first height - 28).
		self addMorph: scrollPane inFrontOf: pageHolder.
		scrollPane scroller addMorph: pageHolder.
		scrollPane scrollBarOnLeft: false.
		scrollPane retractable: false.
		scrollPane hideHScrollBarIndefinitely: true.
		scrollPane borderWidth: 1; borderColor: Color gray.
	].
