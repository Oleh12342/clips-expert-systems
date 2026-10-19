(deftemplate shrub
   (slot name))

(deftemplate trait
   (slot shrub-name)
   (slot feature))

(deftemplate desired-trait
   (slot feature))

(deffacts shrubs-database
   (shrub (name "Деревоподібна гортензія"))
   (shrub (name "Олеандр"))
   (shrub (name "Повстяна восковиця"))
   (shrub (name "Жимолость"))
   (shrub (name "Гарденія"))
   (shrub (name "Звичайний ялівець"))
   (shrub (name "Вільхолиста квітка"))
   (shrub (name "Татарський кизил"))
   (shrub (name "Японська аукуба"))
   (shrub (name "Канадський рододендрон"))

   (trait (shrub-name "Деревоподібна гортензія") (feature міські-умови))
   (trait (shrub-name "Деревоподібна гортензія") (feature діжкове-вирощування))
   (trait (shrub-name "Деревоподібна гортензія") (feature швидкий-ріст))

   (trait (shrub-name "Олеандр") (feature діжкове-вирощування))

   (trait (shrub-name "Повстяна восковиця") (feature холодостійкість))
   (trait (shrub-name "Повстяна восковиця") (feature тіньовитривалість))
   (trait (shrub-name "Повстяна восковиця") (feature посухостійкість))
   (trait (shrub-name "Повстяна восковиця") (feature вологий-ґрунт))

   (trait (shrub-name "Жимолость") (feature міські-умови))
   (trait (shrub-name "Жимолость") (feature простота-культивування))
   (trait (shrub-name "Жимолость") (feature швидкий-ріст))

   (trait (shrub-name "Гарденія") (feature посухостійкість))
   (trait (shrub-name "Гарденія") (feature міські-умови))
   (trait (shrub-name "Гарденія") (feature діжкове-вирощування))
   (trait (shrub-name "Гарденія") (feature простота-культивування))
   (trait (shrub-name "Гарденія") (feature швидкий-ріст))

   (trait (shrub-name "Звичайний ялівець") (feature холодостійкість))
   (trait (shrub-name "Звичайний ялівець") (feature посухостійкість))
   (trait (shrub-name "Звичайний ялівець") (feature кислий-ґрунт))
   (trait (shrub-name "Звичайний ялівець") (feature міські-умови))

   (trait (shrub-name "Вільхолиста квітка") (feature холодостійкість))
   (trait (shrub-name "Вільхолиста квітка") (feature тіньовитривалість))
   (trait (shrub-name "Вільхолиста квітка") (feature вологий-ґрунт))
   (trait (shrub-name "Вільхолиста квітка") (feature кислий-ґрунт))

   (trait (shrub-name "Татарський кизил") (feature холодостійкість))
   (trait (shrub-name "Татарський кизил") (feature тіньовитривалість))
   (trait (shrub-name "Татарський кизил") (feature вологий-ґрунт))
   (trait (shrub-name "Татарський кизил") (feature простота-культивування))
   (trait (shrub-name "Татарський кизил") (feature швидкий-ріст))

   (trait (shrub-name "Японська аукуба") (feature тіньовитривалість))
   (trait (shrub-name "Японська аукуба") (feature діжкове-вирощування))

   (trait (shrub-name "Канадський рододендрон") (feature холодостійкість))
   (trait (shrub-name "Канадський рододендрон") (feature посухостійкість))

   (desired-trait (feature холодостійкість))
   (desired-trait (feature тіньовитривалість)))

(defrule find-matching-shrubs
   (shrub (name ?name))
   (not (and (desired-trait (feature ?f))
             (not (trait (shrub-name ?name) (feature ?f)))))
   =>
   (printout t "Підходить для посадки: " ?name crlf))
