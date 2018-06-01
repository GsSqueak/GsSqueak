memory access
sqGrowMemory: oldLimit By: delta

	transcript show: 'grow memory from ', oldLimit printString, ' by ', delta printString; cr.
	objectMemory setMemory: objectMemory getMemory , (objectMemory getMemory class new: delta // 4).
	^ objectMemory getMemory size * 4