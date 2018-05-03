*EnvironmentsEnv7-updating
recompileAllMethods
  self
    allClassesAndMetaClassesDo: [ :aClass | 
      (aClass persistentMethodDictForEnv: 7)
        ifNotNil: [ :methods | 
          methods
            keysAndValuesDo: [ :selector :aMethod | 
              aClass
                newMethodFromSqueakString: aMethod fullSource
                inEnv: 7
                classified:
                  (aClass categoryOfSelector: selector environmentId: 7) ] ] ]
