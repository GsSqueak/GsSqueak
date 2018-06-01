query
allPrimitiveMethodsInCategories: aList 
	"Answer an OrderedCollection of all the methods that are implemented by 
	primitives in the given categories. 1/26/96 sw"
	"SystemNavigation new allPrimitiveMethodsInCategories:  
	#('Collections-Streams' 'Files-Streams' 'Files-Abstract' 'Files-Macintosh')"

	| result categories |
	result := OrderedCollection new.
	categories := aList collect: [ :each | each asSymbol ].
	categories size > 10 ifTrue: [ categories := categories asIdentitySet ].
	self allBehaviorsDo: [ :behavior | 
		(aList includes: behavior category) ifTrue: [
			behavior selectorsAndMethodsDo: [ :selector :method | 
				method primitive ~= 0 ifTrue: [
					result add: (String streamContents: [ :stream |
						stream
							nextPutAll: behavior name;
							space;
							nextPutAll: selector;
							space;
							print: method primitive ]) ] ] ] ].
	^result