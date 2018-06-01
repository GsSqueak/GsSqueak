classes
categoryNamesFor: aBehavior
  | set |
  set := IdentitySet new.
  aBehavior
    env: self methodCompilationEnvironmentId
    categorysDo: [ :categName :selectors | set add: categName ].
  ^ Array withAll: set