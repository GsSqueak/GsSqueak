as yet unclassified
close
	"Write if we have data to write.  FTP files are always binary to preserve the data exactly.  The binary/text (ascii) flag is just for tell how the bits are delivered from a read."

	remoteFile writable ifTrue: [
			remoteFile putFile: (self as: RWBinaryOrTextStream) reset named: remoteFile fileName]