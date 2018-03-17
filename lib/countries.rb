class WorldStats
  attr_accessor :dataset
  METRICS = %w[gdp population life_expectancy].freeze

  def self.build_dataset
    [
      { country: 'Ethiopia', gdp: 159, population: 222, life_expectancy: 72 },
      { country: 'Mauritania', gdp: 305, population: 402, life_expectancy: 78 },
      { country: 'Moldova', gdp: 741, population: 487, life_expectancy: 67 },
      { country: 'Anguilla', gdp: 382, population: 314, life_expectancy: 68 },
      { country: 'Panama', gdp: 665, population: 440, life_expectancy: 53 },
      { country: 'Taiwan', gdp: 79, population: 39, life_expectancy: 79 },
      { country: 'American Samoa', gdp: 373, population: 381, life_expectancy: 61 },
      { country: 'Hungary', gdp: 68, population: 226, life_expectancy: 75 }
    ]
  end

  def initialize
    self.dataset = WorldStats.build_dataset
  end

  def gdp(calculator: 'mean', countries: nil)
    call_metric(calculator: calculator, countries: countries, metric: :gdp)
  end

  def population(calculator: 'mean', countries: nil)
    call_metric(calculator: calculator, countries: countries, metric: :population)
  end

  def life_expectancy(calculator: 'mean', countries: nil)
    call_metric(calculator: calculator, countries: countries, metric: :life_expectancy)
  end

  def mean(metrics: METRICS, countries: nil)
    calculate(metrics: metrics)
  end

  def median(metrics: METRICS, countries: nil)
    calculate(metrics: metrics, op: :get_median)
  end

  private

  # Given an operator, perform it on every metric
  def calculate(metrics: METRICS, op: :get_mean)
    countries ||= dataset
    result = {}

    metrics.each do |m|
      m = m.to_sym
      result[m] = []

      countries.each do |country|
        result[m] << country[m]
      end
    end

    result.transform_values! { |v| send(op, v) }
  end

  def call_metric(calculator: 'mean', countries: nil, metric:)
    countries ||= dataset
    send(calculator, metrics: [metric], countries: countries).fetch(metric)
  end

  # Helper math methods
  def get_mean(arr)
    arr.sum.to_f / arr.size
  end

  def get_median(arr)
    arr.sort!
    size = arr.length
    (arr[size / 2] + arr[(size - 1) / 2]) / 2.0
  end
end

def perform
  computer = WorldStats.new

  random_subset = lambda do |key|
    max_size = computer.dataset.size
    computer.dataset.sample(Random.rand(0..max_size)).map { |d| d[key] }
  end

  p computer.gdp(calculator: 'median')
  p computer.population(countries: random_subset['country'])
  p computer.life_expectancy
  p computer.mean(metrics: %w[gdp population], countries: random_subset['country'])
  p computer.median
end

perform
