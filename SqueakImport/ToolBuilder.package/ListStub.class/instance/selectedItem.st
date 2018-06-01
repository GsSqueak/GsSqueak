simulating
selectedItem
	| items idx |
	(items  := self list) isEmpty ifTrue: [^ nil].
	(idx := self selectedIndex) = 0 ifTrue: [^ nil].
	^ items at: idx
	