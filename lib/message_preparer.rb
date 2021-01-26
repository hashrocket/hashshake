module MessagePreparer
  class << self
    def prepare
      title = "🤝 Hashshake time!"
      cta = "Take time this week to schedule a 20-minute video call with your assigned friend."

      pair_assignments = pairs.map do |pair|
        assignment = pair.join(" meets with ")
        "- #{assignment}"
      end

      [title, cta, *pair_assignments].join("\n")
    end

    def pairs
      shuffled_names.each_slice(2).reject { |chunk| chunk.length < 2 }
    end

    def shuffled_names
      ENV.fetch('SLACK_NAMES').split(',').shuffle
    end
  end
end
