converting
dimmed	"Answer a dimmed variant of this form."	^ self		collectColors: [:color | color				alpha: (color alpha min: 0.2)]