drawing
drawSlideBorderOn: aCanvas
	"startForm and endFrom are both fixed, but a border slides in the given direction, revealing endForm.  (It's like opening a can of sardines ;-)."
	| endRect box sourceRect boxLoc |
	box := endForm boundingBox.
	boxLoc := self stepFrom: box topLeft - (box extent * direction) to: box topLeft.
	sourceRect := box translateBy: boxLoc.
	endRect := sourceRect translateBy: self position.

	((endRect expandBy: 1) containsRect: aCanvas clipRect) ifFalse:
		[aCanvas drawImage: startForm at: self position].
	aCanvas drawImage: endForm at: self position + boxLoc sourceRect: sourceRect.

	((endRect translateBy: direction) areasOutside: endRect) do:
		[:r | aCanvas fillRectangle: r color: Color black].
