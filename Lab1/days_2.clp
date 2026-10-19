(deffacts what-day-is-it?
	(Today is Thursday)
	(Tomorrow is Friday)
)

(defrule show-today
	(Today is ?day)
	=>
	(printout t "Today is " ?day crlf))