as yet unclassified
convertValue: aValue fromKey: propertyKey
  aValue ifNil: [ ^ aValue ].
  propertyKey = #'dorm_date'
    ifTrue: [ ^ aValue asDate ].
  propertyKey = #'country_codes'
    ifTrue: [ ^ aValue findTokens: ';' ].
  propertyKey = #'incorporation_date'
    ifTrue: [ ^ aValue asDate ].
  propertyKey = #'node_id'
    ifTrue: [ ^ aValue asNumber ].
  ^ aValue