def unCurry (fn : α → β → γ) : α × β → γ := fun (a, b) => fn a b 