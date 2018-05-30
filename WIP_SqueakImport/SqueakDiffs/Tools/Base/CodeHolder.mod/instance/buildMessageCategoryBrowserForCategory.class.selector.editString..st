construction
buildMessageCategoryBrowserForCategory: aCategory class: aClass selector: aSelectorOrNil editString: methodSourceCode 
	"Create and schedule a new class browser for the current selection,
	with initial textual contents set to aString. This is used specifically in
	spawning where a class is established but a method-category is not."
	
	self flag: #uglyHack. "mt: We should not abuse Browser like this. We should not even know about #Browser in this superclass."
	^ (Browser
		newOnClass: aClass
		messageCategory: aCategory
		selector: aSelectorOrNil
		editString: methodSourceCode
		label: 'Message category Browser: ' , aClass name , aCategory)