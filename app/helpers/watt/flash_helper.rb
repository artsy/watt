module Watt
  module FlashHelper
    def flash_view_context(flash_name_str)
      if flash_name_str.include? 'fullscreen'
        'flash-fullscreen'
      elsif flash_name_str.include? 'async'
        'flash-async'
      else
        'flash-form'
      end
    end

    def flash_type(flash_name_str)
      if flash_name_str.include? 'error'
        'flash-error'
      else
        'flash-notice'
      end
    end
  end
end
