{:user {:plugins [[io.aviso/pretty "0.1.34"]
                  [mvxcvi/whidbey "1.3.2"]
                  [jonase/eastwood "0.2.6" :exclusions [org.clojure/clojure]]
                  [lein-kibit "0.1.5"]
                  [lein-cljfmt "0.5.7"]
                  [lein-cljfmt-editor "0.1.0"]
                  [lein-ancient "0.6.15"]
                  [lein-vanity "0.2.0"]]
        :dependencies [[io.aviso/pretty "0.1.34"]
                       [cljfmt "0.5.7"]]
        :cljfmt {:indents {map         [[:inner 0]]
                           assoc       [[:inner 0]]
                           update      [[:inner 0]]
                           into        [[:inner 0]]
                           go-loop     [[:block 1]]
                           <!          [[:block 0]]
                           >!          [[:block 1]]
                           fdef        [[:block 1]]}}}}
