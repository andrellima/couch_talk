module SimplyStored
  module ClassMethods
    module Base
      def get_class_from_name(klass_name)
        klass_name.to_s.gsub('__','/').classify.constantize
      end
      
      def foreign_key
        name.underscore.gsub('/','__').gsub('::','__') + "_id"
      end
      
      def foreign_property
        name.underscore.gsub('/','__').gsub('::','__')
      end
      
      def attr_protected(*args)
        @_protected_attributes ||= []
        @_protected_attributes += args.to_a
      end
      
      def attr_accessible(*args)
        @_accessible_attributes ||= []
        @_accessible_attributes += args.to_a
      end
      
      def _find_property(name)
        properties.find{|property| property.name == name}
      end
    end
  end
end
