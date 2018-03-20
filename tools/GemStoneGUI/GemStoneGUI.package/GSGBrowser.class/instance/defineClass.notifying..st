class functions
defineClass: defString notifying: aController  
	"The receiver's textual content is a request to define a new class. The
	source code is defString. If any errors occur in compilation, notify
	aController."
	| oldClass class |
	oldClass := self selectedClassOrMetaClass.
	class := oldClass subclassDefinerClass
		defineClass: defString
		environment: oldClass environment
		notifying: aController
		ifFail: [^false].
	class category: self selectedSystemCategory.
	self changed: #systemCategoryList.
	self changed: #classList.
	self clearUserEditFlag.
	self setClass: class selector: nil.
	^ true