(ns Colleen)

(def data
[
"(ns Colleen)"
""
"(def data"
"["
nil
""
";; This is the data printing function"
"(defn self-print [self]"
"  (let [pre-code (take-while #(not (nil? %)) self)"
"        post-code (next (drop-while #(not (nil? %)) self))]"
"    (doseq [line pre-code] (println line))"
"    (doseq [line pre-code] (println (str (char 34) line (char 34))))"
"    (println nil)"
"    (doseq [line post-code] (println (str (char 34) line (char 34))))"
"    (println (str (char 93) (char 41)))"
"    (doseq [line post-code] (println line))))"
""
"(defn -main []"
"  ;; This is the main function"
"  (self-print data))"
])

;; This is the data printing function
(defn self-print [self]
  (let [pre-code (take-while #(not (nil? %)) self)
        post-code (next (drop-while #(not (nil? %)) self))]
    (doseq [line pre-code] (println line))
    (doseq [line pre-code] (println (str (char 34) line (char 34))))
    (println nil)
    (doseq [line post-code] (println (str (char 34) line (char 34))))
    (println (str (char 93) (char 41)))
    (doseq [line post-code] (println line))))

(defn -main []
  ;; This is the main function
  (self-print data))
