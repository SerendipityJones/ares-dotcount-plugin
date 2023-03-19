module AresMUSH
  module Dotcount
    class DotcountCmd
      include CommandHandler
 
      attr_accessor :name
 
      def parse_args
        self.name = cmd.args ? titlecase_arg(cmd.args) : enactor_name
      end
 
      def handle
        Dotcount.calculate_dots(self.name, client, enactor)
        pad_xp = (max_xp > 9 && current_xp < 10) ? '.' : ''
        note = poor_attr ? t('dotcount.poor_note_client') : ''
        msg = t('dotcount.result_client', :name => model.name, :spent_attrs => spent_attrs, :spent_action => spent_action, :max_attrs => max_attrs, :max_action => max_action, :max_xp => max_xp, :current_xp => current_xp.to_s, :pad_xp => pad_xp, :note => note )
        template = BorderedDisplayTemplate.new msg
        client.emit template.render
     end
    end
  end  
end