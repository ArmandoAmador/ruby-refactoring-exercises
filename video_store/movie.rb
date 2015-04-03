# Movie is just a simple data class
class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_reader :price_code
  attr_writer :price

  def price_code=(value)
    @price_code = value
    @price =
      case price_code
      when REGULAR
        RegularPrice.new
      when NEW_RELEASE
        NewReleasePrice.new
      when CHILDRENS
        ChildrensPrice.new
      end
  end

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end
