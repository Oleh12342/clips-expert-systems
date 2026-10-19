(deftemplate family-relation
   (slot parent)
   (slot child))

(deftemplate person-role
   (slot name)
   (slot role))

(deftemplate person-gender
   (slot name)
   (slot gender))

(deffacts family-database
   (family-relation (parent "Tom") (child "John"))
   (family-relation (parent "Susan") (child "John"))

   (person-role (name "Tom") (role father))
   (person-role (name "Susan") (role mother))
   (person-role (name "John") (role son))

   (person-gender (name "Tom") (gender male))
   (person-gender (name "Susan") (gender female))
   (person-gender (name "John") (gender male)))

(defrule print-father
   (declare (salience 90))
   (family-relation (parent ?p) (child ?c))
   (person-role (name ?p) (role father))
   =>
   (printout t "The father of " ?c " is " ?p "." crlf))

(defrule print-mother
   (declare (salience 80))
   (family-relation (parent ?p) (child ?c))
   (person-role (name ?p) (role mother))
   =>
   (printout t "The mother of " ?c " is " ?p "." crlf))

(defrule print-parents
   (declare (salience 70))
   (family-relation (parent ?f) (child ?c))
   (person-role (name ?f) (role father))
   (family-relation (parent ?m) (child ?c))
   (person-role (name ?m) (role mother))
   =>
   (printout t "The parents of " ?c " are " ?f " and " ?m "." crlf))

(defrule print-tom-father-role
   (declare (salience 60))
   (person-role (name "Tom") (role ?r))
   =>
   (printout t "Tom is a " ?r "." crlf))

(defrule print-susan-mother-role
   (declare (salience 50))
   (person-role (name "Susan") (role ?r))
   =>
   (printout t "Susan is a " ?r "." crlf))

(defrule print-john-son-role
   (declare (salience 40))
   (person-role (name "John") (role ?r))
   =>
   (printout t "John is a " ?r "." crlf))

(defrule print-tom-gender
   (declare (salience 30))
   (person-gender (name "Tom") (gender ?g))
   =>
   (printout t "Tom is a " ?g "." crlf))

(defrule print-susan-gender
   (declare (salience 20))
   (person-gender (name "Susan") (gender ?g))
   =>
   (printout t "Susan is a " ?g "." crlf))

(defrule print-john-gender
   (declare (salience 10))
   (person-gender (name "John") (gender ?g))
   =>
   (printout t "John is a " ?g "." crlf))
