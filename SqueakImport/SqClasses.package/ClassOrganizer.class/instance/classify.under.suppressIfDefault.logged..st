accessing
classify: element under: heading suppressIfDefault: aBoolean logged: logged 
	| oldCat newCat |
	oldCat := self categoryOfElement: element.
	SystemChangeNotifier uniqueInstance doSilently: [
		super classify: element under: heading suppressIfDefault: aBoolean].
	newCat := self categoryOfElement: element.
	self notifyOfChangedSelector: element from: oldCat to: newCat.
	logged ifTrue: [self logChangedSelector: element category: newCat].
