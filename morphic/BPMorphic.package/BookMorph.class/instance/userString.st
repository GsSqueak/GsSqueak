accessing
userString
	"Do I have a text string to be searched on?"
	| _gsSqueakTemp_list |
	self getAllText.
	_gsSqueakTemp_list := OrderedCollection new.
	(self valueOfProperty: #allText ifAbsent: #())
		do: [:aList | _gsSqueakTemp_list addAll: aList].
	^ _gsSqueakTemp_list