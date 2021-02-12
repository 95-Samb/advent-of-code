class CustomsForm
  def any_yes_answers(forms)
    forms.gsub(/\W/,"").chars.uniq.length
  end
  def shared_yes_answers(forms)
    form_array = forms.split(" ").map(&:chars)
    form_array.inject(:&).length
  end
end
