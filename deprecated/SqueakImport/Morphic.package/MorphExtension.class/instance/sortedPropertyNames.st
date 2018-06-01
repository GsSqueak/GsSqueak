accessing - other properties
sortedPropertyNames
	"answer the receiver's property names in a sorted way"

	| props |
	props := WriteStream on: (Array new: 10).
	locked == true ifTrue: [props nextPut: #locked].
	visible == false ifTrue: [props nextPut: #visible].
	sticky == true ifTrue: [props nextPut: #sticky].
	balloonText isNil ifFalse: [props nextPut: #balloonText].
	balloonTextSelector isNil ifFalse: [props nextPut: #balloonTextSelector].
	externalName isNil ifFalse: [props nextPut: #externalName].
	isPartsDonor == true ifTrue: [props nextPut: #isPartsDonor].
	actorState isNil ifFalse: [props nextPut: #actorState].
	player isNil ifFalse: [props nextPut: #player].
	eventHandler isNil ifFalse: [props nextPut: #eventHandler].
	 otherProperties ifNotNil: [otherProperties associationsDo: [:a | props nextPut: a key]].
	^props contents sort: [:s1 :s2 | s1 <= s2]