copying
updateReferencesUsing: aDictionary
  super updateReferencesUsing: aDictionary.
  self pages
    do: [ :page | page allMorphsDo: [ :m | m updateReferencesUsing: aDictionary ] ]