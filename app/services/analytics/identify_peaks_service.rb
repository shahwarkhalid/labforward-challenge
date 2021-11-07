module Analytics
  class IdentifyPeaksService
    attr_accessor :data, :threshold

    def initialize(data:, threshold:)
      self.data = data.map(&:to_i)
      self.threshold = threshold.to_i
    end

    def call
      { signal: data.map{ |element| ((element - mean)/standard_deviation) > threshold ? 1 : 0 } }
    end

    private

    def mean
      @mean ||= data.sum(0.0) / data.size
    end

    def standard_deviation
      @standard_deviation ||= Math.sqrt(((data.sum(0.0) { |element| (element - mean) ** 2 }) / (data.size - 1)))
    end
  end
end
