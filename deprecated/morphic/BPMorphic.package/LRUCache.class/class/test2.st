testing
test2
	"
	LRUCache test2. 
	Time millisecondsToRun:[LRUCache test2]. 
	MessageTally spyOn:[LRUCache test2]. 
	"
	| _gsSqueakTemp_c |
	_gsSqueakTemp_c := LRUCache
				size: 600
				factory: [:key | key * 2].
	1
		to: 6000
		do: [:each | _gsSqueakTemp_c at: each].
	^ _gsSqueakTemp_c