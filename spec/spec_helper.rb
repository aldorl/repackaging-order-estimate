RSpec.configure do |config|
  # Colored STDOUT
  config.color_enabled = true
  
  # Colored pagers and files
  config.tty = true
  
  config.formatter = :documentation, :textmate # :progress, :html
end