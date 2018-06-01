*SqueakEnvironments
associationsDo: aBlock
  | symList |
  symList := System myUserProfile symbolList.
  1 to: symList size do: [ :j | (symList at: j) ifNotNil: [ :aDict | aDict associationsDo: aBlock ] ]