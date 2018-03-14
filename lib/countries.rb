class WorldStats
  attr_accessor :dataset

  def self.build_dataset
    [
      {:country=>"Ethiopia", :gdp=>159, :population=>222, :life_expectancy=>72}, 
      {:country=>"Mauritania", :gdp=>305, :population=>402, :life_expectancy=>78}, 
      {:country=>"Moldova", :gdp=>741, :population=>487, :life_expectancy=>67}, 
      {:country=>"Anguilla", :gdp=>382, :population=>314, :life_expectancy=>68}, 
      {:country=>"Panama", :gdp=>665, :population=>440, :life_expectancy=>53}, 
      {:country=>"Taiwan", :gdp=>79, :population=>39, :life_expectancy=>79}, 
      {:country=>"American Samoa", :gdp=>373, :population=>381, :life_expectancy=>61}, 
      {:country=>"Hungary", :gdp=>68, :population=>226, :life_expectancy=>75}
    ] 
  end

  def initialize
    self.dataset = WorldStats.build_dataset
  end 

  def gdp(calculator: 'mean')
  end

  def population(calculator: 'mean')
  end

  def life_expectancy(calculator: 'mean')
  end

  def mean(metrics: METRICS)
  end

  def median(countries: 'all', metrics: METRICS)
  end

  private_constant :METRICS
  METRICS = ['gdp', 'population', 'life_expectancy']
end

def perform
  computer = WorldStats.new

  random_subset = lambda do |key|
    max_size = computer.dataset.size
    computer.dataset.sample(Random.rand(0..max_size)).map{|d|d[key]}
  end
  
  computer.gdp(calculator: 'median')
   # --> e.g 128.1
  computer.population(countries: random_subset['country'])
   # --> e.g 92.02
  computer.life_expectancy
  # --> e.g 70.3  
  computer.mean(metrics: %w(gdp population), countries: random_subset['country']) 
  # --> e.g {gdp: 444, population: 122}
  computer.median
  # --> i.e same as above, applying median to all countries over all metrics  
end

############ INSTRUCTIONS ############

# Copy the contents of this file and paste your code below the perform method.
# Your code should respond to the five functions demoed in the perform method.
# Submit your modified file by email.

# Every parameter is optional. They work as follows:
# calculator --> defaults to 'mean'. Supported by the first gpd(), population(), and life_expectancy()
# countries --> defaults to all the countries in the dataset. Supported by all methods.
# metrics --> defaults to ['gdp', 'population', 'life_expectancy']. Supported by mean() and median()

# We're looking for elegant, DRY, and readable code.

# Bonus: make a Country class whose fields are dynmically generated by the dataset, e.g Country.new("UK").population 