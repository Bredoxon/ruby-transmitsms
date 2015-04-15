
class DeliveryStats
  attr_accessor :delivered, :pending, :bounced, :responses, :optouts
  # :internal => :external
  def self.attribute_map
    {
      :delivered => :'delivered',
      :pending => :'pending',
      :bounced => :'bounced',
      :responses => :'responses',
      :optouts => :'optouts'
      
    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    
    if self.class.attribute_map[:"delivered"]
      @delivered = attributes["delivered"]
    end
    
    if self.class.attribute_map[:"pending"]
      @pending = attributes["pending"]
    end
    
    if self.class.attribute_map[:"bounced"]
      @bounced = attributes["bounced"]
    end
    
    if self.class.attribute_map[:"responses"]
      @responses = attributes["responses"]
    end
    
    if self.class.attribute_map[:"optouts"]
      @optouts = attributes["optouts"]
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
