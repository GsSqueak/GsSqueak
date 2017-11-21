*BPToolsTode
squeakLoadMenuAction: aListItem squeakLoad: aSelectedString
  BPCodeClient importClass: aSelectedString asSymbol.
  aListItem topez evaluateTopezScript: 'browse class ' , aSelectedString