require "rails_helper"

RSpec.describe ExcuseGenerator do
  describe ".count" do
    it "has at least 500 excuse variants" do
      expect(described_class.count).to be >= 500
    end
  end

  describe ".generate" do
    it "returns one of the curated excuses" do
      excuse = described_class.generate(random: Random.new(7))

      expect(described_class::EXCUSES).to include(excuse)
    end

    it "returns a colleague-directed sentence" do
      excuse = described_class.generate(random: Random.new(11))

      expect(excuse).to start_with("Hi team colleagues,")
      expect(excuse.length).to be > 120
    end

    it "covers the requested excuse themes and expanded topics across the catalog" do
      joined_excuses = described_class::EXCUSES.join(" ").downcase

      expect(joined_excuses).to include("recover")
      expect(joined_excuses).to include("headache")
      expect(joined_excuses).to match(/niece|nephew/)
      expect(joined_excuses).to match(/fever|cough|illness|sick|flu/)
      expect(joined_excuses).to match(/plumber|technician|transit|delivery|inspection/)
      expect(joined_excuses).to match(/cat|smoke detector|chair|charger/)
    end
  end
end
