private
startDownload
	| newDownloadProcess |
	
	downloads size >= self maxNrOfConnections ifTrue: [^self].
	requests size <= 0 ifTrue: [^self].

	newDownloadProcess := [
		[
			self nextRequest startRetrieval
		] on: FTPConnectionException do: [ :ex | 
			Cursor normal show.
			self removeProcess: Processor activeProcess.
			self startDownload
		].
		self removeProcess: Processor activeProcess.
		self startDownload
	] newProcess.
	downloads add: newDownloadProcess.
	newDownloadProcess resume