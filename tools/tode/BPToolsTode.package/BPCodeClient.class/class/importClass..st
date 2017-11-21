as yet unclassified
importClass: aSymbol
  | tcpSocket rwStream buffer |
  tcpSocket := Socket newTCP.
  tcpSocket connectTo: self codeHost port: 1742.	"tcpSocket waitForConnectionFor: 2."
  tcpSocket sendData: aSymbol asString.
  buffer := ''.
  [ tcpSocket isConnected ]
    whileTrue: [ buffer := buffer , (tcpSocket readString: 100000000) ].
  rwStream := RWBinaryOrTextStream on: buffer.
  [ rwStream fileIn ]
    on: CompileError
    do: [ :sig | 
      | err |
      err := sig gsArguments first.
      (err first at: 3) = 'undefined symbol'
        ifTrue: [ Transcript show: 'missing:' , (err first at: 5) ] ]