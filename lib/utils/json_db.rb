require "json"

class JSONDB
  DATA_DIR = File.expand_path('../../data', __dir__)

  def initialize(args)
    @name = args[:name]
    @klass = args[:name]

    # Create file if not found
    reset unless File.exist?(file_path)
  end

  def read
    File.open(file_path, "r") do |f|
      JSON.load(f)
    end
  end

  def write(records)
    File.open(file_path, "w") do |f|
      JSON.dump(records, f)
    end
  end

  def reset
    write([])
  end

  def insert(data)
    data.id = latest_index
    records = read
    records.push(data)
    write(records)
  end

  private
    def file_path
      File.join(DATA_DIR, @name+".json")
    end

    def latest_index
      ids = read
        .map { |r| r.id }
      return 1 if ids.length <= 0

      ids.max + 1
    end
end
