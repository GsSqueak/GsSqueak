saving
saveFrom: anEnvironment

	| categories classNames classes |
	categories := anEnvironment systemCategories select: [:gsCat |
		self categoriesToLoad anySatisfy: [:cat |
			self category: gsCat matches: cat]].

	'Gathering class names'
		displayProgressFrom: 0
		to: categories size
		during: [:categoryBar |
			classNames := OrderedCollection streamContents: [:stream |
				categories withIndexDo: [:category :categoryIndex |
					stream nextPutAll: (anEnvironment classNamesInSystemCategory: category asSymbol).
					categoryBar value: categoryIndex]].
			(self classesToLoad do: [:className |
				classNames addIfNotPresent: className asSymbol])].
		
	'Gathering classes'
		displayProgressFrom: 0
		to: classNames size
		during: [:classBar |
			classes := Array streamContents: [:stream |
				classNames withIndexDo: [:className :classIndex |
					stream nextPut: (anEnvironment classNamed: className).
					classBar value: classIndex]]].
	
	'Collecting changes to classes'
		displayProgressFrom: 0
		to: classes size
		during: [:classBar |
			classes withIndexDo: [:class :classIndex |
				self write: (self classDefinitions at: class name) with: class.
				classBar value: classIndex]].
	self fileout.