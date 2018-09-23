module FileCreator
  # Generic alphanumeric string for creating text.
  ALPHANUMERIC = 'abcdefghijklmnopqrstuvwxyz 123456890'.freeze

  def self.generate(lines)
    return false if lines < 1

    file = Rails.root.join('tmp', "file_#{lines}.txt")

    unless File.file?(file)
      File.open(file, 'w') do |f|
        lines.times { |n| f.puts("Line #{n+1}: #{ALPHANUMERIC}") }
      end

      return true
    end

    false
  end
end
