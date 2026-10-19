(deftemplate person
	(multislot name)
	(slot age (type INTEGER))
	(slot gender (allowed-values male female)))

(deffacts people
	(person (name "Oleh" "Kulesh") (age 20) (gender male))
	(person (name "Kira" "Ivanova") (age 18) (gender female))
	(person (name "Dima" "Krivyshenko") (age 22) (gender male)))

(defrule find-by-name
	(person (name "Kira" $?rest) (age ?age))
	=>
	(printout t "Found person named Kira, age: " ?age crlf))

(defrule find-by-age-20
	(person (name $?person-name) (age 20))
	=>
	(printout t "Person age 20 is: " $?person-name crlf))