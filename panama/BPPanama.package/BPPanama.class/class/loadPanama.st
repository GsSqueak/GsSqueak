as yet unclassified
loadPanama
  | entityFiles relationFiles reader |
  entityFiles := #('addresses.csv' 'entities.csv' 'intermediaries.csv' 'officers.csv').
  relationFiles := #('all_edges.csv').
  reader := [ :fileName | 
  (ServerFileDirectory on: '/home/jakob/Studium/bp/panama')
    readOnlyFileNamed: fileName
    do: [ :strm | (NeoCSVReader on: strm) upToEnd ] ].
  Entities := IdentityDictionary new: 350000.
  entityFiles
    do: [ :fileName | 
      | keys rawEntities |
      (ServerFileDirectory on: '/home/jakob/Studium/bp/panama')
        readOnlyFileNamed: fileName
        do: [ :strm | 
          | parser |
          parser := NeoCSVReader on: strm.
          keys := parser next collect: [ :k | k asSymbol ].
          parser
            do: [ :entity | 
              | newEntity |
              newEntity := IdentityDictionary new.
              keys
                withIndexDo: [ :key :index | 
                  | value |
                  value := entity at: index.	"Convert the value"
                  value := self convertValue: value fromKey: key asSymbol.
                  newEntity at: key put: value ].
              Entities at: (newEntity at: #'node_id') put: newEntity	"System commit" ] ] ]	"  Entities := IdentityDictionary withAll: Entities"	"
  resultRelations := OrderedCollection new.
  relationFiles
    do: [ :fileName | 
      | rawRelations |
      rawRelations := reader value: fileName.
      rawRelations copyWithoutFirst
        do: [ :relation | 
          | source relationName target |
          source := relation first asNumber.
          relationName := relation second asSymbol.
          target := relation third asNumber.
          (resultEntities at: source)
            at: relationName
            put: (resultEntities at: target) ] ].
  ^ resultEntities"