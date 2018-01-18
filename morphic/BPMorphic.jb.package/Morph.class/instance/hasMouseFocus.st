event handling
hasMouseFocus	^ self activeHand		ifNil: [false]		ifNotNil: [:hand | self hasMouseFocus: hand]