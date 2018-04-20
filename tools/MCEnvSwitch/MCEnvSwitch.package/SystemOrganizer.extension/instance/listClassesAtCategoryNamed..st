*MCEnvSwitch
listClassesAtCategoryNamed: cat
  ^ (self categoryDict at: cat asSymbol ifAbsent: [ #() ])
    collect: [ :each | each ]