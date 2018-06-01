event handling
mouseDown: evt

        ^ self
                perform: (currentTools at: #mouseDown: ifAbsent: [^nil])
                with: evt