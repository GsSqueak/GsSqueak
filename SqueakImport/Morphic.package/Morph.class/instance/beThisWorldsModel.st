meta-actions
beThisWorldsModel

	self world setModel: self.
	self model: nil slotName: nil.	"A world's model cannot have another model"