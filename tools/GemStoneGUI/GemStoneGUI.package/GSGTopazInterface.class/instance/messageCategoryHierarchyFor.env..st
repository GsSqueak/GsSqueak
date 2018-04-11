custom commands
messageCategoryHierarchyFor: classProxy env: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: '[ :class :envId | 
  | string |
  string := String new.
  class env: envId unifiedCategoriesDo: [ :categoryName :selectors | 
      string addAll: categoryName.
      string add: Character lf.
      selectors do: [ :selector | 
          string addAll: ''  ''.
          string addAll: selector.
          string add: Character lf ] ].
  string allButLast ] value: (' , classProxy codeReferencingMe , ') value: ' , envId.
	^ topazOutput first