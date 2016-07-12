class PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        class DeletePizza
          attr_accessor :args

          def initialize(args:, database_adapter:, validators: [Validator.new])
            @args       = args
            @database_adapter = database_adapter
            @validators = validators
          end

          def call(use_case=nil)
            validate
            delete
            self
          end

          def errors
            @errors = validators.flat_map { |validator| validator.errors }
          end

          private

          attr_accessor :database_adapter, :validators

          def validate
            validators.each do |validator|
              validator.call(self)
            end
          end

          def delete
            database_adapter[:pizzas].delete(id: args[:id])
          end
        end
      end
    end
  end
end
