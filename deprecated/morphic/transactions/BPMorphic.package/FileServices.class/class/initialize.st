accessing
initialize
  "FileServices initialize"

  Smalltalk allClasses
    do: [ :aClass | 
      (aClass class includesSelector: #'fileReaderServicesForFile:suffix:')
        ifTrue: [ self registerFileReader: aClass ] ]