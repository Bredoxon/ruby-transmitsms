
class ErrorInfo
  attr_accessor :code, :description
  # :internal => :external
  def self.attribute_map
    {
      :code => :'code',
      :description => :'description'
      
    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    
    if self.class.attribute_map[:"code"]
      @code = attributes["code"]
    end
    
    if self.class.attribute_map[:"description"]
      @description = attributes["description"]
    end
    
  end

  def to_body
    body = {}
    self.class.attribute_map.each_pair do |key, value|
      body[value] = self.send(key) unless self.send(key).nil?
    end
    body
  end
end
