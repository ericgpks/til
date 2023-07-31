class Person
  extend ActiveModel::Callbacks
  include ActiveModel::Serialization
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  attr_accessor :created_at, :updated_at, :name, :age

  before_validation :normalize_name, if: -> { name.present? }
  validates :name, presence: true, length: { maximum: 100 }
  validates_numericality_of :age, greater_than_or_equal_to: 0
  define_model_callbacks :test

  before_test :record_timestamps

  def attributes
    { name: name, age: age }
  end

  def to_xml(options = nil)
    serializable_hash(options).to_xml(camelize: :lower, root: self.class.name)
  end

  def test
    run_callbacks :test do
      true
    end
  end

  private

  def record_timestamps
    current_time = Time.current

    self.created_at ||= current_time
    self.updated_at = current_time
  end

  def normalize_name
    self.name = name.downcase.titleize
  end
end
