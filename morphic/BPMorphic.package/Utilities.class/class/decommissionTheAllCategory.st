miscellaneous
decommissionTheAllCategory
	"Utilities decommissionTheAllCategory"
	"Moves all methods that are in a category named 'all' into the default
	'as yet unclassified' category"
	| _gsSqueakTemp_methodCount _gsSqueakTemp_classCount |
	self flag: #ShouldBeMovedIntoClassOrganization.
	"sd"
	_gsSqueakTemp_methodCount := 0.
	_gsSqueakTemp_classCount := 0.
	self systemNavigation
		allBehaviorsDo: [:aClass | 
			| org any |
			org := aClass organization.
			any := false.
			aClass
				selectorsDo: [:aSelector | 
					| aCategory |
					aCategory := org categoryOfElement: aSelector.
					aCategory = #all
						ifTrue: [org
								classify: aSelector
								under: ClassOrganizer default
								suppressIfDefault: false.
							_gsSqueakTemp_methodCount := _gsSqueakTemp_methodCount + 1.
							any := true]].
			any
				ifTrue: [_gsSqueakTemp_classCount := _gsSqueakTemp_classCount + 1].
			org removeEmptyCategories].
	Transcript cr; show: _gsSqueakTemp_methodCount printString , ' methods in ' , _gsSqueakTemp_classCount printString , ' classes moved
from "all" to "as yet unclassified"'