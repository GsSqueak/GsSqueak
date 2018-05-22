font creation
generateDejaVuMethods: directory
	"StrikeFont generateDejaVuMethods: 'DejaVu'."
	| dir formTemplate dataTemplate methodCategory |
	methodCategory := #'dejaVu font data'.
	formTemplate := '{1}
	<generated>
	" Form data for {2}. Generated with StrikeFont generateDejaVuMethods: ''{3}''"
	^Form fromBinaryStream: (
''{4}''
	) base64Decoded asByteArray readStream
'.
	dataTemplate := '{1}
	<generated>
	" Font meta data for {2}. Generated with StrikeFont generateDejaVuMethods: ''{3}''"
	^ #({4})
'.
	dir := FileDirectory default / directory.
	#('*.txt' 'Data' '*.png' 'Form') pairsDo: 
		[:match :suffix | (dir fileNamesMatching: match)
			do: 
				[:local | | selector source stringContent|
					" .txt and .png have both length 4"
					selector := (local allButLast: 4) asLegalSelector, suffix.
					stringContent := dir readOnlyFileNamed: local do:
						[:stream | suffix = 'Data'
							ifTrue: [stream contentsOfEntireFile]
							ifFalse: [(stream binary; contentsOfEntireFile) base64Encoded]].
					source := (suffix = 'Data' ifTrue: [dataTemplate] ifFalse: [formTemplate])
						format: {selector . (local allButLast: 4) . directory . stringContent }.
					self class compile: source classified: methodCategory]
			displayingProgress: [:local | 'Generating ', local]].