class Statement
  
  # TODO: test seams - remove after refactor
  attr_accessor :total_statement_amount
  attr_accessor :total_renter_points

  def initialize(customer)
    @customer = customer
  end

  def generate
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@customer.name}\n"
    @customer.rentals.each do |element|

      # determine amounts for each line
      this_amount = element.total_cost

      # add frequent renter points
      frequent_renter_points += element.renter_points_earned

      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    @total_statement_amount = total_amount
    @total_renter_points = frequent_renter_points

    # add footer lines
    result += "Amount owed is #{total_amount.to_s}\n"
    result += "You earned #{frequent_renter_points.to_s} frequent renter points"
    result
  end
end
