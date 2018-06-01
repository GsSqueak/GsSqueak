categories
categoryFromUserWithPrompt: aPrompt for: aClass
	"self new categoryFromUserWithPrompt: 'testing' for: SystemDictionary"

	|  labels myCategories reject lines newName menuIndex | 
	labels := OrderedCollection with: 'new...'.
	labels addAll: (myCategories := aClass organization categories sorted:
		[:a :b | a asLowercase < b asLowercase]).
	reject := myCategories asSet.
	reject
		add: ClassOrganizer nullCategory;
		add: ClassOrganizer default.
	lines := OrderedCollection with: 1 with: (myCategories size + 1).

	aClass allSuperclasses do:
		[:cls |
			| cats |
			cats := cls organization categories reject:
				 [:cat | reject includes: cat].
			cats isEmpty ifFalse:
				[lines add: labels size.
				labels addAll: (cats sort:
					[:a :b | a asLowercase < b asLowercase]).
				reject addAll: cats]].

	newName := (labels size = 1 or:
		[menuIndex := (UIManager default chooseFrom: labels lines: lines title: aPrompt).
		menuIndex = 0 ifTrue: [^ nil].
		menuIndex = 1])
			ifTrue:
				[UIManager default request: 'Please type new category name'
					initialAnswer: 'category name']
			ifFalse: 
				[labels at: menuIndex].
	^ newName ifNotNil: [newName asSymbol]