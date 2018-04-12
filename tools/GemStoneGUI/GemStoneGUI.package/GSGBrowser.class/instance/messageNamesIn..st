message list
messageNamesIn: category

	| categoryDict selectors |
	categoryDict := self messageCategoryDict ifNil: [^ #()].
	selectors := categoryDict at: category ifAbsent: [^ #()].
	^ selectors sorted