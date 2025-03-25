| auto critics data prNumber url classesNames classes methods |

classesNames := (Smalltalk os environment at: 'steps.files.outputs.all') splitOn: ' '.
classes := classesNames collect: [ :className | Smalltalk classNamed: className ].
methods := classes flatCollect: [:clazz | clazz methods ].

methods do: [ :aMethod |
    auto := AutoReneraku new.
    auto token: (Smalltalk os environment at: 'PAT').
    auto fillData: data withNewMethodData: aMethod.
    data at: 'commit_id' put: (Smalltalk os environment at: 'COMMIT_SHA').
    prNumber := (Smalltalk os environment at: 'PULL_REQUEST_NUMBER').
    url := 'https://api.github.com/repos/badetitou/AutoReneraku/pulls/', prNumber, '/comments'.
    Stdio stderr << data printString.
    auto post: url contents: data
]
