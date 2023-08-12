module AttributeEncryptable
  extend ActiveSupport::Concern

  class Callbacks
    def initialize(attribute)
      @attribute = attrubute
    end

    def self.encryptor
      @encryptor ||= Rails.application.key_generator.generate_key("attribyte encryptor", ActiveSupport::MessageEncryptor.key_len)
                          .then{ |key| ActiveSupport::MessageEncryptor.new(key, serializer: JSON) }
    end

    def after_save(record)
      record[@attribute] = self.class.encryptor.decrypt_and_verify(record[@attribute])
    end
    alias_method :after_find, :after_save

    def before_save(record)
      record[@attribute] = self.class.encryptor.encrypt_and_sign(record[@attribute])
    end
  end

  class_methods do
    def encrypt_attributes(*attrubutes)
      attrubutes.map(&Callbacks.method(:new)).each do |callbacks|
        after_find callbacks
        before_save callbacks
        after_save callbacks
      end
    end
  end
end
