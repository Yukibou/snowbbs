class AvalancheProblemDecorator
  def initialize(avalanche_problem)
    @avalanche_problem = avalanche_problem
    @avalanche_problem.zone_details.build(zone: :alpine)
    @avalanche_problem.zone_details.build(zone: :treeline)
    @avalanche_problem.zone_details.build(zone: :below_treeline)
    @avalanche_problem
  end

  def formatted_created_at
    @avalanche_problem.created_at.to_formatted_s(:short)
  end

  def method_missing(method_sym, *args)
    if @avalanche_problem.respond_to?(method_sym)
      @avalanche_problem.send(method_sym, *args)
    else
      super
    end
  end

  def self.duplicate(avalanche_problem)
    @avalanche_problem = avalanche_problem
    @avalanche_problem.zone_details.build(zone: :alpine)
    @avalanche_problem.zone_details.build(zone: :treeline)
    @avalanche_problem.zone_details.build(zone: :below_treeline)
    @avalanche_problem
  end
end