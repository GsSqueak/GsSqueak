definitions
definitionFromClassDefinition: aClassDefinition
  | aClass superClass |
  aClass := aClassDefinition theClass.
  superClass := aClass superclassForEnv: self classLookupEnvironmentId.
  ^ aClass
    _ogDefinitionInContext: System myUserProfile
    className: aClass name
    superClassName:
      (superClass == nil
        ifTrue: [ 'nil' ]
        ifFalse: [ superClass name ])