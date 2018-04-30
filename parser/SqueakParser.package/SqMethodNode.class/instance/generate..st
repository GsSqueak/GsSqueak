code-generation
generate: bytes

|gsAst gsMethod|

self flag: #hack.
"hardcoded envId"

gsAst := self asGemstoneNodeInEnvironment: 7.
  (gsMethod := GsNMethod generateFromIR: gsAst) _isArray
    ifTrue: [ gsMethod := gsMethod first ].

^ gsMethod
