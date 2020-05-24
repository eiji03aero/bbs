class Validator
  attr_accessor :validations

  def initialize
    @validations = []
  end

  def add(name, opts)
    validations.push([name, opts])
  end

  def execute(obj)
    validations
      .map { |v| execute_validation(obj, v) }
      .flatten
      .compact
  end

  private
    def execute_validation(obj, v)
      name, opts = v
      opts
        .to_a
        .map do |arr|
          vname, vvalue = arr
          Validation::execute(
            object: obj,
            attr_name: name,
            validation_name: vname,
            validation_value: vvalue,
          )
        end
    end
end
