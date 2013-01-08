module RsvpHelper
  def english_name(number)
    # We're only going to handle some from zero to five.
    if number >= 0 && number <= 5
      conversion = [ "zero", "one", "two", "three", "four", "five" ]
      return conversion[number]
    end

    # Too high of a number, return nothing
    return ("")
  end

  # http://apidock.com/rails/ActionView/Helpers/TextHelper/pluralize
  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
end
