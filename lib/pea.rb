class Pea

	attr_accessor :contents, :file, :hash, :rendered

	def initialize(file = nil, relative_to = nil)
		unless file.nil?
			self.read(file, relative_to)
		end
	end


	def read(file, relative_to = nil)

		unless relative_to.nil?
			file = File.join(relative_to, file)
		end

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
		
		@hash.each do |key, value|
			unless value.nil?
				@contents = @contents.gsub(/\{#{Regexp.escape(key)}\}/, value)
			end
		end

		@rendered = @contents

		@rendered
	end
end
