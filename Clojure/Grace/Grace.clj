(ns Grace)

;; This program is only macro-based
(defmacro data []
[
"(ns Grace)"
""
";; This program is only macro-based"
"(defmacro data []"
"["
nil
""
"(defmacro self-print [self w]"
"  `(let [pre-code# (take-while #(not (nil? %)) ~self)"
"        post-code# (next (drop-while #(not (nil? %)) ~self))]"
"     (doseq [line# pre-code#] (.write ~w (str line# (char 10))))"
"     (doseq [line# pre-code#] (.write ~w (str (char 34) line# (char 34) (char 10))))"
"     (.write ~w (str (char 110) (char 105) (char 108) (char 10)))"
"     (doseq [line# post-code#] (.write ~w (str (char 34) line# (char 34) (char 10))))"
"     (.write ~w (str (char 93) (char 41) (char 10)))"
"     (doseq [line# post-code#] (.write ~w (str line# (char 10))))))"
""
"(defmacro grace []"
"  `(do"
"    (with-open [w# (clojure.java.io/writer (name :Grace_kid.clj))]"
"      (self-print (data) w#))))"
""
"(grace)"
])

(defmacro self-print [self w]
  `(let [pre-code# (take-while #(not (nil? %)) ~self)
        post-code# (next (drop-while #(not (nil? %)) ~self))]
     (doseq [line# pre-code#] (.write ~w (str line# (char 10))))
     (doseq [line# pre-code#] (.write ~w (str (char 34) line# (char 34) (char 10))))
     (.write ~w (str (char 110) (char 105) (char 108) (char 10)))
     (doseq [line# post-code#] (.write ~w (str (char 34) line# (char 34) (char 10))))
     (.write ~w (str (char 93) (char 41) (char 10)))
     (doseq [line# post-code#] (.write ~w (str line# (char 10))))))

(defmacro grace []
  `(do
    (with-open [w# (clojure.java.io/writer (name :Grace_kid.clj))]
      (self-print (data) w#))))

(grace)
