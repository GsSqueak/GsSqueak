accessing
classify: element under: newCategory
	| oldCategory class |
	self flag: #environments. "do we want notifications for classes in other environments?"
	oldCategory := self categoryOfElement: element.
	super classify: element under: newCategory.
	class := Smalltalk at: element ifAbsent: [^ self].
	self == SystemOrganization ifTrue: [
		SystemChangeNotifier uniqueInstance
			class: class
			recategorizedFrom: oldCategory
			to: newCategory]