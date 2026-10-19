(deftemplate tree-node
	(slot id (type SYMBOL))
	(slot question (type STRING))
	(slot no-branch (type SYMBOL))
	(slot yes-branch (type SYMBOL))
	(slot conclusion (type STRING)))

(deffacts animal-decision-tree
	(tree-node
		(id root)
		(question "Воно велике?")
		(no-branch small-branch)
		(yes-branch large-branch))

	(tree-node
		(id small-branch)
		(question "Видає писк?")
		(no-branch leaf-squirrel)
		(yes-branch leaf-mouse))

	(tree-node
		(id leaf-squirrel)
		(conclusion "Це білка?"))

	(tree-node
		(id leaf-mouse)
		(conclusion "Це миша?"))

	(tree-node
		(id large-branch)
		(question "Має довгу шию?")
		(no-branch trunk-branch)
		(yes-branch leaf-giraffe))

	(tree-node
		(id leaf-giraffe)
		(conclusion "Це жираф?"))

	(tree-node
		(id trunk-branch)
		(question "Mae xo60T?")
		(no-branch water-branch)
		(yes-branch leaf-elephant))

	(tree-node
		(id leaf-elephant)
		(conclusion "Це слон?"))

	(tree-node
		(id water-branch)
		(question "Полюбдяє знаходитися у воді?")
		(no-branch leaf-rhino)
		(yes-branch leaf-hippo))

	(tree-node
		(id leaf-rhino)
		(conclusion "Le Hocopir?"))

	(tree-node
		(id leaf-hippo)
		(conclusion "Це гипопотам?")))