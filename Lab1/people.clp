(deftemplate person
	(slot name)
	(slot age)
	(slot gender))

(deffacts people
	(person (name "oleh") (age 20) (gender male))
	(person (name "Kira") (age 18) (gender female))
	(person (name "Dima") (age 22) (gender male)))