  (ServerFileDirectory on: '$GS_HOME/shared/......')
    readOnlyFileNamed: 'Morph.st'
    do: [ :fileStream | fileStream fileIn ].
