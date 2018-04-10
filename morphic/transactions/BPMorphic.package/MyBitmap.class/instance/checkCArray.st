as yet unclassified
checkCArray
  self halt.
  cArray memoryAddress == 0
    ifTrue: [ Transcript show: 'dead' ]