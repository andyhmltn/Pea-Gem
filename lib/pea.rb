class Pea

	attr_accessor :file_contents, :file, :hash, :rendered

	def initialize(file = nil)
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
	end

	def read_static(static_contents)
		@contents = static_contents
	end

	def render(hash)
		@hash = hash
		
		@hash.each do |key, value|
			unless value.nil?
				@contents = @contents.gsub(/\{#{Regexp.escape(key)}\}/, value)
			end
		end

		@rendered = @contents

		@rendered
	end
end
