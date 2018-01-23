as yet unclassified
gsifyClassSpec: aClassSpec
  | newClassSpec |
  newClassSpec := aClassSpec copyReplaceAll: '# (' with: '#('.
  ^ newClassSpec