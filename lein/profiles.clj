{:user {:plugins [[io.aviso/pretty "0.1.33"]
                  [jonase/eastwood "0.2.4"]
                  [lein-kibit "0.1.5"]
                  [lein-cljfmt "0.5.6"]
                  [lein-ancient "0.6.10"]
                  [lein-vanity "0.2.0"]
                  [lein-cljfmt-editor "0.1.0"]]
        :dependencies [[io.aviso/pretty "0.1.33"]
                       [cljfmt "0.5.6"]
                       [debugger "0.2.0"]]
        :repl-options {:init (require 'cljfmt.core)}
        :cljfmt {:indents {assoc         [[:block 1]]
                           update        [[:block 2]]
                           send          [[:block 1]]
                           go-try        [[:block 1]]
                           go-super      [[:block 1]]
                           go-loop-super [[:block 2]]
                           execute       [[:block 1]]
                           execute-async [[:block 1]]}}}}
