class initialization
initialize
  Smalltalk addToStartUpList: self.	"HACK"
  Smalltalk addToShutDownList: self.
  self installKeyDecodeTable.
  self installMouseDecodeTable.
  self install