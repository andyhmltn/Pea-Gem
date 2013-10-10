class Pea
	module Version
		MAJOR  = 1
    	MINOR  = 3
    	PATCH  = 0

    	FULL = [MAJOR, MINOR, PATCH].join('.')

    	class << self
    		def to_s
    			FULL
    		end
    	end
	end

	attr_accessor :contents, :file, :hash, :rendered

	def initialize(file = nil)
		unless file.nil?
			self.read(file)
		end
	end


	def read(file)
		@file = File.new file, "r"

		if !file.empty?
			file_contents = ""
			while line = @file.gets
				file_contents << line
			end
		end

		@contents = file_contents

		return self
	end

	def read_static(static_contents)
		@contents = static_contents

		return self
	end

	def render(hash)
		@hash = hash
		
		pre_rendered_content = @contents

		@hash.each do |key, value|
			unless value.nil?
				@contents = @contents.gsub(/\{#{Regexp.escape(key)}\}/, value)
			end
		end

		@rendered = @contents
		@contents = pre_rendered_content

		return @rendered
	end
end
