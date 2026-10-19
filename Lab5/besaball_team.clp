;;; ===== Імена гравців =====
(deffacts names
   (name Andy) (name Ed) (name Paul) (name Allen) (name Harry)
   (name Bill) (name Sam) (name Jerry) (name Mike))

;;; ===== Функції =====

;; Умовний зріст: з умови Сем > Джеррі > Білл > Майк.
;; Для інших 0 (невідомо).
(deffunction height (?n)
   (switch ?n
      (case Sam then 5)
      (case Jerry then 4)
      (case Bill then 3)
      (case Mike then 2)
      (default 0)))

;; Чи нижчий гравець за Сема (Аллен, Гаррі, Енді - виняток)
(deffunction shorter-than-sam (?n)
   (if (member$ ?n (create$ Allen Harry Andy))
      then (return TRUE))
   (return (< (height ?n) (height Sam))))

;; Центральний фільдер вищий за правого
;; (якщо зріст обох невідомий, суперечності немає)
(deffunction cf-taller (?cf ?rf)
   (if (or (= (height ?cf) 0) (= (height ?rf) 0))
      then (return TRUE))
   (return (> (height ?cf) (height ?rf))))

;; Виведення позиції та імені
(deffunction print-player (?position ?name)
   (printout t ?position ": " ?name crlf))

;;; ===== Правило =====
(defrule find-team
   ;; Кетчер: не Енді (не любить), не Пол/Гаррі/Білл (програли 2-му бейсмену),
   ;; не Сем (лівша), одружений (двоє дітей), тому не Ед/Джеррі
   (name ?C&~Andy&~Paul&~Harry&~Bill&~Sam&~Ed&~Jerry)
   ;; 3-й бейсмен: не Гаррі, не Білл, не Сем (лівша), одружений
   (name ?B3&~Harry&~Bill&~Sam&~Ed&~Paul&~Jerry&~?C)
   ;; Шорт-стоп: не Пол, Енді, Білл, Ед, Сем
   (name ?SS&~Paul&~Andy&~Bill&~Ed&~Sam&~?C&~?B3)
   ;; 2-й бейсмен: не Ед (сестра), не Пол/Гаррі/Білл
   (name ?B2&~Ed&~Paul&~Harry&~Bill&~?C&~?B3&~?SS)
   ;; Пітчер: не Пол і не Аллен (виграли в нього)
   (name ?P&~Paul&~Allen&~?C&~?B3&~?SS&~?B2)
   ;; Правий і центральний фільдери: холостяки, не Ед/Пол/Джеррі,
   ;; не Сем (одружений), не Аллен/Гаррі/Енді
   (name ?RF&~Ed&~Paul&~Jerry&~Sam&~Andy&~Allen&~Harry&~?C&~?B3&~?SS&~?B2&~?P)
   (name ?CF&~Ed&~Paul&~Jerry&~Sam&~Andy&~Allen&~Harry&~?C&~?B3&~?SS&~?B2&~?P&~?RF)
   ;; Лівий фільдер: не Ед (грає в покер із зовнішніми гравцями)
   (name ?LF&~Ed&~Andy&~Allen&~Harry&~?C&~?B3&~?SS&~?B2&~?P&~?RF&~?CF)
   ;; 1-й бейсмен: той, хто залишився
   (name ?B1&~?C&~?B3&~?SS&~?B2&~?P&~?RF&~?CF&~?LF)
   ;; Батарея та інфілд нижчі за Сема
   (test (shorter-than-sam ?P))
   (test (shorter-than-sam ?C))
   (test (shorter-than-sam ?B1))
   (test (shorter-than-sam ?B2))
   (test (shorter-than-sam ?B3))
   (test (shorter-than-sam ?SS))
   ;; Центральний вищий за правого
   (test (cf-taller ?CF ?RF))
   ;; Серед зовнішніх є Майк або Енді
   (test (member$ Mike (create$ ?LF ?CF ?RF)))
   =>
   (printout t "Склад команди:" crlf)
   (print-player "Пітчер          " ?P)
   (print-player "Кетчер          " ?C)
   (print-player "1-й бейсмен     " ?B1)
   (print-player "2-й бейсмен     " ?B2)
   (print-player "3-й бейсмен     " ?B3)
   (print-player "Шорт-стоп       " ?SS)
   (print-player "Лівий фільдер   " ?LF)
   (print-player "Центр. фільдер  " ?CF)
   (print-player "Правий фільдер  " ?RF))
