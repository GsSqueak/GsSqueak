*BPToolsTode
squeakLoadMenuAction: aListItem squeakLoad: aSelectedString
  (self shouldClassBeLoaded: aSelectedString)
    ifFalse: [ ^ false ].
  BPCodeClient importClass: aSelectedString asSymbol.
  aListItem topez evaluateTopezScript: 'browse class ' , aSelectedString