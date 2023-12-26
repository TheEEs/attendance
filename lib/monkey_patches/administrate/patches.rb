require "administrate/page/collection"
module MonkeyPatches::Administrate
  module Patches
    extend self
    def perform
      Administrate::Order.class_eval do
        def order_by_belongs_to(relation)
          if sort_field = reflect_association(relation).klass.try(:sort_field)
            @association_attribute = sort_field
          end
          sort_expression = reflect_association(relation).klass.try(:sort_expression)
          if ordering_by_association_column?(relation)
            order_by_attribute(relation)
          elsif sort_expression
            relation.reorder(sort_expression.public_send(direction))
          else
            order_by_id(relation)
          end
        end

        def order_params_for(attr, &b)
          {
            order: attr,
            direction: reversed_direction_param_for(attr),
            page: b&.call || 1
          }
        end
      end

      Administrate::Page::Collection.class_eval do
        def order_params_for(attr, key: resource_name)
          { key => order.order_params_for(attr) { yield if block_given? } }
        end
      end
    end
  end
end
