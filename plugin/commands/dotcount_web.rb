module AresMUSH
    module Dotcount  
      def self.web_dotcount(char)
        Dotcount.calculate_dots(char, Character, char)
          if remaining_attrs == 0 && remaining_action == 0
            msg = t('dotcount.web_max_both')
          elsif remaining_attrs == 0
            msg = t('dotcount.web_max_attrs', :remaining_action => remaining_action, :plural => remaining_action == 1 ? '' : 's' )
          else
            msg =t('dotcount.web_more_attrs',:remaining_attrs => remaining_attrs, :plural => remaining_attrs == 1 ? '' : 's' )
            if remaining_action == 0
              msg += t('dotcount.web_max_action')
            else
              msg += t('dotcount.web_more_action', :remaining_action => remaining_action)
            end
          end
          if poor_attr
            msg += t('dotcount.poor_note_web')
          end
          return msg
        end
      end
    end
  end