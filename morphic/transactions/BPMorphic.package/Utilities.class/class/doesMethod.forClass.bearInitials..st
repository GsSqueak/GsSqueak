miscellaneous
doesMethod: aSelector forClass: aClass bearInitials: initials 
	"Answer whether a method bears the given initials at the head of its
	time stamp"
	| _gsSqueakTemp_aTimeStamp _gsSqueakTemp_implementingClass _gsSqueakTemp_aMethod |
	_gsSqueakTemp_implementingClass := aClass whichClassIncludesSelector: aSelector.
	_gsSqueakTemp_implementingClass
		ifNil: [^ false].
	(_gsSqueakTemp_aMethod := _gsSqueakTemp_implementingClass compiledMethodAt: aSelector)
		ifNil: [^ false].
	^ (_gsSqueakTemp_aTimeStamp := _gsSqueakTemp_aMethod timeStamp) notNil
		and: [_gsSqueakTemp_aTimeStamp beginsWith: initials]