
class Success
  attr_accessor :message_id, :send_at, :recipients, :cost, :sms, :delivery_stats, :error
  # :internal => :external
  def self.attribute_map
    {
      :message_id => :'message_id',
      :send_at => :'send_at',
      :recipients => :'recipients',
      :cost => :'cost',
      :sms => :'sms',
      :delivery_stats => :'delivery_stats',
      :error => :'error'
      
    }
  end

  def initialize(attributes = {})
    return if attributes.empty?
    # Morph attribute keys into undescored rubyish style
    
    if self.class.attribute_map[:"message_id"]
      @message_id = attributes["message_id"]
    end
    
    if self.class.attribute_map[:"send_at"]
      @send_at = attributes["send_at"]
    end
    
    if self.class.attribute_map[:"recipients"]
      @recipients = attributes["recipients"]
    end
    
    if self.class.attribute_map[:"cost"]
      @cost = attributes["cost"]
    end
    
    if self.class.attribute_map[:"sms"]
      @sms = attributes["sms"]
    end
    
    if self.class.attribute_map[:"delivery_stats"]
      @delivery_stats = attributes["delivery_stats"]
    end
    
    if self.class.attribute_map[:"error"]
      @error = attributes["error"]
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
