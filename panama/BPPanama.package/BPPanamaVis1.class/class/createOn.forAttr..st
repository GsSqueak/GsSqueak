as yet unclassified
createOn: data forAttr: anAttr
  | statistic newbie |
  newbie := self new.
  statistic := IdentityDictionary new.
  data
    do: [ :each | 
      | val |
      val := each at: anAttr.
      (statistic
        at: (val ifNil: [ #'nil' ] ifNotNil: [ val asSymbol ])
        ifAbsentPut: [ BPPanamaVis1BucketMorph newForParent: newbie withLabel: val ])
        add: each ].
  newbie statistic: statistic.
  ^ newbie