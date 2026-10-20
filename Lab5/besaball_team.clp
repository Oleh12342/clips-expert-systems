;;; ===== Імена гравців =====
(deffacts names
   (name Andy) (name Ed) (name Paul) (name Allen) (name Harry)
   (name Bill) (name Sam) (name Jerry) (name Mike))

;;; ===== Функції =====
;; Умовний зріст з умови: Сем > Джеррі > Білл > Майк.
;; Для інших гравців 0 (зріст невідомий).
(deffunction height (?n)
   (switch ?n
      (case Sam then 5)
      (case Jerry then 4)
      (case Bill then 3)
      (case Mike then 2)
      (default 0)))

;; Центральний фільдер вищий за правого.
;; Якщо зріст когось із двох невідомий, суперечності немає.
(deffunction cf-taller (?cf ?rf)
   (if (or (= (height ?cf) 0) (= (height ?rf) 0))
      then (return TRUE))
   (return (> (height ?cf) (height ?rf))))

;; Виведення позиції та імені гравця
(deffunction print-player (?position ?name)
   (printout t ?position ": " ?name crlf))

;;; ===== Правило =====
(defrule find-team
   ;; Кетчер: не Енді (не любить); не Пол/Гаррі/Білл (програли 2-му);
   ;; не Сем (лівша); одружений (діти): не Ед/Пол/Джеррі
   (name ?C&~Andy&~Paul&~Harry&~Bill&~Sam&~Ed&~Jerry)
   ;; 3-й бейсмен: не Гаррі, не Білл, не Сем (лівша); одружений
   (name ?B3&~Harry&~Bill&~Sam&~Ed&~Paul&~Jerry&~?C)
   ;; 2-й бейсмен: не Ед (сестра), не Пол/Гаррі/Білл; одружений; не Сем
   (name ?B2&~Ed&~Paul&~Harry&~Bill&~Jerry&~Sam&~?C&~?B3)
   ;; Пітчер: не Пол і Аллен (виграли в нього); одружений; не Сем
   (name ?P&~Paul&~Allen&~Ed&~Jerry&~Sam&~?C&~?B3&~?B2)
   ;; Шорт-стоп: не Пол, Енді, Білл; не Ед і Сем (одна школа)
   (name ?SS&~Paul&~Andy&~Bill&~Ed&~Sam&~?C&~?B3&~?B2&~?P)
   ;; Правий фільдер: холостяк, не Сем (розлучення), не Ед (покер)
   (name ?RF&~Ed&~Sam&~?C&~?B3&~?B2&~?P&~?SS)
   ;; Центральний фільдер: холостяк, не Сем, не Ед
   (name ?CF&~Ed&~Sam&~?C&~?B3&~?B2&~?P&~?SS&~?RF)
   ;; Лівий фільдер: не Ед (грає в покер із зовнішніми гравцями)
   (name ?LF&~Ed&~?C&~?B3&~?B2&~?P&~?SS&~?RF&~?CF)
   ;; 1-й бейсмен: той, хто залишився; не Сем (інфілд нижчий за Сема)
   (name ?B1&~Sam&~?C&~?B3&~?B2&~?P&~?SS&~?RF&~?CF&~?LF)
   ;; Сем має бути зовнішнім гравцем (лівий фільдер)
   (test (eq ?LF Sam))
   ;; Центральний фільдер вищий за правого
   (test (cf-taller ?CF ?RF))
   =>
   (printout t "--- Склад команди ---" crlf)
   (print-player "Пітчер          " ?P)
   (print-player "Кетчер          " ?C)
   (print-player "1-й бейсмен     " ?B1)
   (print-player "2-й бейсмен     " ?B2)
   (print-player "3-й бейсмен     " ?B3)
   (print-player "Шорт-стоп       " ?SS)
   (print-player "Лівий фільдер   " ?LF)
   (print-player "Центр. фільдер  " ?CF)
   (print-player "Правий фільдер  " ?RF)
   (halt))