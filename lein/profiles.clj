{:user {:plugins [[io.aviso/pretty "1.1"]
                  [mvxcvi/whidbey "2.2.1"]
                  [lein-kibit "0.1.8"]
                  [lein-ancient "0.6.15"]]
        :middleware [io.aviso.lein-pretty/inject
                     whidbey.plugin/repl-pprint]
        :dependencies [[io.aviso/pretty "1.1"]]}}
