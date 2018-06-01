*MCEnvSwitch
classes
  ^ (self systemCategories
    gather: [ :cat | SystemOrganizer new listClassesAtCategoryNamed: cat ])
    sortBy: [ :a :b | 
      ((MCEnv respondsTo: #'usesSqueakParser') and: [ MCEnv usesSqueakParser ])
        ifFalse: [ a className <= b className ]
        ifTrue: [ a @env7: name <= b @env7: name ] ]