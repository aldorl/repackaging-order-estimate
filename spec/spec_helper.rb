require_relative '../repackaging_order'

RSpec.configure do |config|
  # Colored STDOUT
  config.color = true
  
  # Colored pagers and files
  config.tty = true
  
  config.formatter = :documentation # :textmate, :progress, :html
end