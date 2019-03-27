(ns Sully
  (:require [clojure.java.shell :refer [sh]]))

(def data
[
"(ns Sully"
"  (:require [clojure.java.shell :refer [sh]]))"
""
"(def data"
"["
nil
""
"(defn self-print [self w]"
"  (let [pre-code (take-while #(not (nil? %)) self)"
"        post-code (next (drop-while #(not (nil? %)) self))]"
"    (doseq [line pre-code] (.write w (str line (char 10))))"
"    (doseq [line pre-code] (.write w (str (char 34) line (char 34) (char 10))))"
"    (.write w (str (char 110) (char 105) (char 108) (char 10)))"
"    (doseq [line post-code] (.write w (str (char 34) line (char 34) (char 10))))"
"    (.write w (str (char 93) (char 41) (char 10)))"
"    (.write w (str (char 10) (char 40) (name :def) (char 32) (name :sully-n) (char 32) (dec sully-n) (char 41) (char 10)))"
"    (doseq [line post-code] (.write w (str line (char 10))))))"
""
"(defn -main []"
"  (when (<= 0 sully-n)"
"    (with-open [w (clojure.java.io/writer (str (name :Sully_) sully-n (name :.clj)))]"
"      (self-print data w))"
"    (sh (name :clojure) (str (name :Sully_) sully-n (name :.clj)))"
"    (System/exit 0)))"
""
"(-main)"
])

(def sully-n 5)

(defn self-print [self w]
  (let [pre-code (take-while #(not (nil? %)) self)
        post-code (next (drop-while #(not (nil? %)) self))]
    (doseq [line pre-code] (.write w (str line (char 10))))
    (doseq [line pre-code] (.write w (str (char 34) line (char 34) (char 10))))
    (.write w (str (char 110) (char 105) (char 108) (char 10)))
    (doseq [line post-code] (.write w (str (char 34) line (char 34) (char 10))))
    (.write w (str (char 93) (char 41) (char 10)))
    (.write w (str (char 10) (char 40) (name :def) (char 32) (name :sully-n) (char 32) (dec sully-n) (char 41) (char 10)))
    (doseq [line post-code] (.write w (str line (char 10))))))

(defn -main []
  (when (<= 0 sully-n)
    (with-open [w (clojure.java.io/writer (str (name :Sully_) sully-n (name :.clj)))]
      (self-print data w))
    (sh (name :clojure) (str (name :Sully_) sully-n (name :.clj)))
    (System/exit 0)))

(-main)
