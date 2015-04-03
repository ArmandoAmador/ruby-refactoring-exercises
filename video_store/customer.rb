# Customer class represents the customer of the store
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end

  private

  def total_charge
    @rentals.inject(0) { |a, e| a + e.charge }
  end

  def frequent_renter_points
    @rentals.inject(0) { |a, e| a + e.frequent_renter_points }
  end
end
