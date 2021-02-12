class CustomsForm
  def yes_answers(form)
    form.gsub(/\W/,"").chars.uniq.length
  end
end
