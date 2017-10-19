class creation
ensureSystemUserMethodsPresent: session
  session
    compile:
        (Behavior compiledMethodAt: #'persistentSuperclassForEnv:put:') sourceString
      inClass: Behavior
      classified: 'Updating';
    compile:
        (Behavior compiledMethodAt: #'persistentSuperclassForEnv:') sourceString
      inClass: Behavior
      classified: 'Accessing';
    yourself