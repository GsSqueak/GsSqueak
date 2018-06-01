class initialization
initialize
	"Build the default MIDI command-byte action table. This table maps MIDI command bytes to the action to be performed when that is received. Note that MIDI data bytes (bytes whose value is < 128) are never used to index into this table."
	"MIDIInputParser initialize"

	DefaultMidiTable := Array new: 255 withAll: #undefined:.
	128 to: 143 do: [:i | DefaultMidiTable at: i put: #recordTwo:].		"key off"
	144 to: 159 do: [:i | DefaultMidiTable at: i put: #recordTwo:].		"key on"
	160 to: 175 do: [:i | DefaultMidiTable at: i put: #recordTwo:].		"polyphonic after-touch"
	176 to: 191 do: [:i | DefaultMidiTable at: i put: #recordTwo:].		"control change"
	192 to: 207 do: [:i | DefaultMidiTable at: i put: #recordOne:].		"program change"
	208 to: 223 do: [:i | DefaultMidiTable at: i put: #recordOne:].		"channel after-touch"
	224 to: 239 do: [:i | DefaultMidiTable at: i put: #recordTwo:].		"pitch bend"

	DefaultMidiTable at: 240 put: #startSysExclusive:.		"start a system exclusive block"
	DefaultMidiTable at: 241 put: #recordOne:.			"MIDI time code quarter frame"
	DefaultMidiTable at: 242 put: #recordTwo:.			"song position select"
	DefaultMidiTable at: 243 put: #recordOne:.			"song select"
	DefaultMidiTable at: 244 put: #undefined:.
	DefaultMidiTable at: 245 put: #undefined:.
	DefaultMidiTable at: 246 put: #recordZero:.			"tune request"
	DefaultMidiTable at: 247 put: #endSysExclusive:.		"end a system exclusive block"
	DefaultMidiTable at: 248 put: #recordZero:.			"timing clock"
	DefaultMidiTable at: 249 put: #undefined:.
	DefaultMidiTable at: 250 put: #recordZero:.			"start"
	DefaultMidiTable at: 251 put: #recordZero:.			"continue"
	DefaultMidiTable at: 252 put: #recordZero:.			"stop/Clock"
	DefaultMidiTable at: 253 put: #undefined:.
	DefaultMidiTable at: 254 put: #recordZero:.			"active sensing"
	DefaultMidiTable at: 255 put: #recordZero:.			"system reset"
