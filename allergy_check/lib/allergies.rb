class Allergies
  attr_reader :allergy_list
  def initialize
    @allergy_list = {
      "cats" => 128, "pollen" => 64, "chocolate" => 32,
      "tomatoes" => 16, "straberries" => 8, "shellfish" => 4,
      "peanuts" => 2, "eggs" => 1
  }
  end

  def score(number)
    return allergy_list.key(number) if allergy_list.has_value?(number)

    possible_allergies = allergy_list.keep_if {|k,v| v <= number}
    allergies = []
    possible_allergies.each do |k,v|
      allergies << k if v <= number
      number -= v if v <= number
      if v <= number
        allergies << k
        number -= v
      end
    end
    allergies
  end
end