{:user {:plugins [[io.aviso/pretty "0.1.34"]
                  [mvxcvi/whidbey "1.3.2"]
                  [jonase/eastwood "0.2.4"]
                  [lein-kibit "0.1.5"]
                  [lein-cljfmt "0.5.7"]
                  [lein-ancient "0.6.15"]
                  [lein-vanity "0.2.0"]]
        :dependencies [[io.aviso/pretty "0.1.34"]
                       [cljfmt "0.5.7"]]
        :cljfmt {:indents {map               [[:inner 0]]
                           mapv              [[:inner 0]]
                           into              [[:inner 0]]
                           group-by          [[:inner 0]]
                           sort-by           [[:inner 0]]
                           assoc             [[:inner 0]]
                           assoc!            [[:inner 0]]
                           update            [[:inner 0]]
                           send              [[:block 1]]
                           send-off          [[:block 1]]
                           go-loop           [[:block 1]]
                           go-try            [[:block 1]]
                           go-super          [[:block 1]]
                           go-loop-try       [[:block 2]]
                           go-loop-super     [[:block 2]]
                           on-abort          [[:block 1]]
                           thread-try        [[:block 1]]
                           execute           [[:block 1]]
                           execute-async     [[:block 1]]
                           pipeline          [[:block 2]]
                           pipeline-blocking [[:block 2]]}}}}
