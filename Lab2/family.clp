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

	(person-role (name "Tome") (role father))
	(person-role (name "Susan") (role mother))
	(person-role (name "John") (role son))

	(person-gender (name "Tom") (gender male))
	(person-gender (name "Susan") (gender female))
	(person-gender (name "John") (gender male)))