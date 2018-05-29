stepping and presenter
step

        count := count + 1.
        count > colors size ifTrue: [count := 1].
        self borderColor: (colors at: count)