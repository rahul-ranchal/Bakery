class Product < ApplicationRecord
  has_many :packages , :dependent => :destroy


  def find_minimum_packages(quantity)
    packages = self.packages.map(&:size)
    return nil if (quantity < 0 or quantity != quantity.floor)
    final_packages = Array.new(quantity + 1)
    final_packages[0] = 0
    list = [[0, 0]]
    while final_packages[quantity].nil? && !list.empty? do
      base, starting_index = list.shift
      starting_index.upto(packages.size - 1) do |index|
        pkg_size = packages[index]
        tot = base + pkg_size
        if tot <= quantity && final_packages[tot].nil?
          final_packages[tot] = base
          list << [tot, index]
        end
      end
    end

    return nil if final_packages[quantity].nil?
    result = []
    while quantity > 0 do
      package = final_packages[quantity]
      result << quantity - package
      quantity = package
    end
    result.sort!.reverse!
  end
end
