class functions
findMethod
	"Pop up a list of the current class's methods, and select the one chosen by the user"
	| aClass selectors reply cat messageCatIndex messageIndex |
	self classListIndex = 0 ifTrue: [^ self].
	self okToChange ifFalse: [^ self].
	aClass := self selectedClassOrMetaClass.
	selectors := aClass selectors sorted.
	selectors isEmpty ifTrue: [self inform: aClass name, ' has no methods.'. ^ self].
	reply := UIManager default 
		chooseFrom: selectors
		values: selectors
		lines: #(1).
	reply ifNil: [^ self].
	cat := aClass whichCategoryIncludesSelector: reply.
	messageCatIndex := self messageCategoryList indexOf: cat.
	self messageCategoryListIndex: messageCatIndex.
	messageIndex := (self messageList indexOf: reply).
	self messageListIndex: messageIndex