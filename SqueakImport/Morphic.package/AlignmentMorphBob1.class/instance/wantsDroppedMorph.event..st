as yet unclassified
wantsDroppedMorph: aMorph event: evt

	| handlerForDrops |

	handlerForDrops := self valueOfProperty: #handlerForDrops ifAbsent: [
		^super wantsDroppedMorph: aMorph event: evt
	].
	^handlerForDrops wantsDroppedMorph: aMorph event: evt inMorph: self