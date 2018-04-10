fileIn/Out
writeAttributesOn: file 
	| _gsSqueakTemp_colorArray |
	super writeAttributesOn: file.
	_gsSqueakTemp_colorArray := self colors asColorArray.
	1
		to: (2 raisedTo: depth)
		do: [:idx | file
				nextLittleEndianNumber: 4
				put: (_gsSqueakTemp_colorArray basicAt: idx)]