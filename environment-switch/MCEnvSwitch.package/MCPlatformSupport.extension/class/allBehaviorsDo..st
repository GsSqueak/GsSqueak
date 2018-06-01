*MCEnvSwitch
allBehaviorsDo: aBlock
  "Evaluate the argument, aBlock, for each kind of Behavior in the system 
	(that is, Object and its subclasses)."

  ((MCEnv respondsTo: #'usesSqueakParser') and: [ MCEnv usesSqueakParser ])
    ifTrue: [ 
      (Smalltalk at: #'SqueakEnvironment')
        allClassesDo: [ :class | 
          aBlock value: class.
          aBlock value: class class ] ]
    ifFalse: [ 
      aBlock value: Object.
      aBlock value: Object class.
      aBlock value: ProtoObject.
      aBlock value: ProtoObject class.
      Object
        allSubclassesDo: [ :cl | 
          aBlock value: cl.
          aBlock value: cl class ].
      aBlock value: ClientForwarder.
      aBlock value: ClientForwarder class ]