(deftemplate person
	(multislot name)
	(slot age (type INTEGER))
	(slot gender (allowed-values male female)))

(deffacts people
	(person (name "Oleh" "Kulesh") (age 20) (gender male))
	(person (name "Kira" "Ivanova") (age 18) (gender female))
	(person (name "Dima" "Krivyshenko") (age 22) (gender male)))