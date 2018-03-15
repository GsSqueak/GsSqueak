current selection
reverseSelection
	"Reverse the valence of the current selection highlighting."
	selectionShowing := selectionShowing not.
	paragraph reverseFrom: pointBlock to: markBlock