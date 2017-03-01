module Validator
  module Validators
    @@nums = [
      %w(zero cero),
      %w(one uno),
      %w(two dos),
      %w(three tres),
      %w(four cuatro),
      %w(five cinco),
      %w(six seis),
      %w(seven siete),
      %w(eight ocho),
      %w(nine nueve)
    ]

    def self.clean_text(string)
      string = @@nums.each_with_index.reduce(string) do |str, item|
        matches, index = *item

        matches.reduce(str) do |s, n|
          s.gsub(Regexp.new(n), index.to_s)
        end
      end

      string
        .downcase
        .gsub(/\s+/, "")
    end

    def self.is_telephone_number(string)
      string.match /\d{8}/
    end

    def self.is_email(string)
      string.match /\w+@\w+\.\w+/
    end
  end

  def validate_text(string)
    clean = Validators.clean_text string

    not %w(is_telephone_number is_email).map do |method|
      Validators.send(method.to_sym, clean)
    end.any?
  end
end