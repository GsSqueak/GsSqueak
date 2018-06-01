translating
removeTemporaries
  self temporaries
    do: [ :tmp | 
      | gsVarLeaf |
      gsVarLeaf := tmp removeFromDictionary ].
  self arguments do: [ :arg | arg removeFromDictionary ]