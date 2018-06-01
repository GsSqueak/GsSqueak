event handling
mouseMove: evt

        ^ self
                perform: (currentTools at: #mouseMove: ifAbsent: [^nil])
                with: evt