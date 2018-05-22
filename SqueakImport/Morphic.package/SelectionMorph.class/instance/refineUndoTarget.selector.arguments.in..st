undo
refineUndoTarget: target selector: selector arguments: arguments in: refineBlock
	"Any morph can override this method to refine its undo specification"
	selector == #fillStyle: ifTrue:
		[refineBlock value: target value: #fillStyleForItems: value: {undoProperties}.
		^ undoProperties := nil].
	selector == #borderColor: ifTrue:
		[refineBlock value: target value: #borderColorForItems: value: {undoProperties}.
		^ undoProperties := nil].
	selector == #borderWidth: ifTrue:
		[refineBlock value: target value: #borderWidthForItems: value: {undoProperties}.
		^ undoProperties := nil].
	selector == #undoMove:redo:owner:bounds:predecessor: ifTrue:
		["This is the biggy.  Need to gather parameters for all selected items"
		refineBlock value: target
			value: #undoMove:redo:owner:bounds:predecessor:
			value: {arguments first.
					arguments second.
					selectedItems collect: [:m | m owner].
					selectedItems collect: [:m | m bounds].
					selectedItems collect: [:m | m owner morphPreceding: m]}].
	refineBlock value: target value: selector value: arguments