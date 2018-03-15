miscellaneous
fixUpProblemsWithAllCategory
	"Moves all methods that are in formally classified a category named '--
	all --' into the default 'as yet unclassified' category"
	"Utilities fixUpProblemsWithAllCategory"
	| _gsSqueakTemp_methodCount _gsSqueakTemp_classCount |
	self flag: #ShouldBeMovedInClassOrganization.
	_gsSqueakTemp_methodCount := 0.
	_gsSqueakTemp_classCount := 0.
	self systemNavigation
		allBehaviorsDo: [:aClass | 
			| org any |
			org := aClass organization.
			(org categories includes: #'-- all --')
				ifTrue: [any := false.
					aClass
						selectorsDo: [:aSelector | 
							| aCategory |
							aCategory := org categoryOfElement: aSelector.
							aCategory = #'-- all --'
								ifTrue: [org
										classify: aSelector
										under: ClassOrganizer default
										suppressIfDefault: false.
									Transcript cr; show: aClass name , ' >> ' , aSelector.
									_gsSqueakTemp_methodCount := _gsSqueakTemp_methodCount + 1.
									any := true]].
					any
						ifTrue: [_gsSqueakTemp_classCount := _gsSqueakTemp_classCount + 1].
					org removeEmptyCategories]].
	Transcript cr; show: _gsSqueakTemp_methodCount printString , ' methods in ' , _gsSqueakTemp_classCount printString , ' classes moved from "-- all --" to "as yet unclassified"'