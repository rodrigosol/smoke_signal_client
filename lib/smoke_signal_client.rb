require "net/http"
require "uri"

module SmokeSignalClient
  module SmokeSignal
    module InstanceMethods
      
      def smoke_signal_send_event
          uri = URI.parse("http://localhost:3000/event")
          http = Net::HTTP.new(uri.host, uri.port)
          request = Net::HTTP::Post.new(uri.request_uri)
          request.set_form_data(ss_parse(self.class.get_smoke_signal_attributes))
          response = http.request(request)
      end

      #handle_asynchronously :smoke_signal_send_event     

      def ss_parse(attrs)
        keys = attrs[1]
        constraints = attrs[0]
        puts "keys #{keys.inspect}"
        puts "constraints #{constraints.inspect}"


        event = {
          :system => "TESTE",
          :constraints => {},
          :keys => {} 
        }

        constraints.each do |c|
          puts "send #{send(c)}"
          event[:constraints][c] = send(c)
        end

        keys.each_key do |k|
          puts "k: #{k}"
          event[:keys][k] = send(keys[k])
        end

        return event
      end

    end

    module ClassMethods

        def alarm (constraints,&block)
          puts  "Definindo o alarme"
          @smoke_signal_keys = {}
          @smoke_signal_constraints = constraints
          yield(block)
          instance_variable_set(:@foo,'rodrigo')
        end

        def set(value,key)
          puts "set #{value} : #{key}"
          @smoke_signal_keys[key] = value
        end

        def get_smoke_signal_attributes
          return @smoke_signal_constraints, @smoke_signal_keys
        end

    end

    def self.included(base)
      base.extend(ClassMethods)
      base.send :include, InstanceMethods
      base.after_commit :smoke_signal_send_event
    end

  end

end
