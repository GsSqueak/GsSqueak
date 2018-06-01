debugging
debugMethod: aCompiledMethod forReceiver: anObject inContext: aContextOrNil
	"Just execute the method and return the result. We cannot know how interactive debugging works for arbitrary projects."
	
	^ aCompiledMethod
		valueWithReceiver: anObject
		 arguments: (aContextOrNil
							ifNil: [#()]
							ifNotNil: [{aContextOrNil}])