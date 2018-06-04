*SqSuperclasses
recompileAllMethodsUsingSqueakParserInEnv: env
  "Recompile all environment 7 methods for execution in a Gs64 v3.0 or later system."

	(self persistentMethodDictForEnv: env)
	  ifNotNil: [ :methods | 
	    methods
	      keysAndValuesDo: [ :selector :aMethod | 
	        self
		        newMethodFromSqueakString: aMethod fullSource
		        inEnv: env
		        classified:
		          (self categoryOfSelector: selector environmentId: env) ] ]
