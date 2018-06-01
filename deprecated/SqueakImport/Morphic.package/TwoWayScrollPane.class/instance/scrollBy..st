geometry
scrollBy: delta
	"Move the contents in the direction delta."
	"For now, delta is assumed to have a zero x-component. Used by scrollIntoView:"
	| r newOffset |

	newOffset := (scroller offset - delta max: 0@0) min: self leftoverScrollRange.
	scroller offset: newOffset.

	r := self leftoverScrollRange.
	r y = 0
		ifTrue: [yScrollBar value: 0.0]
		ifFalse: [yScrollBar value: newOffset y asFloat / r y].
	r x = 0
		ifTrue: [xScrollBar value: 0.0]
		ifFalse: [xScrollBar value: newOffset x asFloat / r x].
