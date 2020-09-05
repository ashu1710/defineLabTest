module SlugGenerator
  def slug_value
    "#{([*('A'..'Z'),*('a'..'z'),*('0'..'9')]-%W(0 1 I O a b)).sample(12).join}"
  end
end