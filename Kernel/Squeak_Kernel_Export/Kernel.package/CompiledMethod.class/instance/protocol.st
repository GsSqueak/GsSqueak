accessing
protocol
	^self methodClass ifNotNil:
		[:class|
		self selector ifNotNil:
			[:selector|
			class whichCategoryIncludesSelector: selector]]