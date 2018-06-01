utilities
extantMethodsIn: aListOfMethodRefs
	"Answer the subset of the incoming list consisting only of those message markers that refer to methods actually in the current image"


	self flag: #mref.	"may be removed in second round"


	^ aListOfMethodRefs select: [:aToken |
		self 
			parse: aToken 
			toClassAndSelector: [ :aClass :aSelector |
				aClass notNil and: [aClass includesSelector: aSelector]
			]
	]