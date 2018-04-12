updating
initialize2AllCLasses
  self
    allClassesDo: [ :aClass | 
      (aClass class persistentMethodDictForEnv: 7)
        ifNotNil: [ :methods | 
          methods
            keysAndValuesDo: [ :selector :aMethod | 
              selector = #'initialize2'
                ifTrue: [ aClass perform: #'initialize2' env: 7 ] ] ] ]