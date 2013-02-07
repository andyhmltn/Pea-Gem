class Pea

	attr_accessor :file_contents, :hash, :replaced

	def initialize(file = nil)
		self.open_and_read_file(file)
	end

	def self.open_and_read_file(file)
		if !file.empty?
			file = File.new(file, "r")
			@file_contents = ""
			while line = file.gets
				@file_contents << line
			end
		end
	end

	def self.replaced
		@hash.each do |key, value|
			@file_contents = @file_contents.gsub(/\{#{Regexp.escape(key)}\}/, value)
		end

		@file_contents
	end

	def self.render(file, hash)
		self.open_and_read_file(file)
		@hash = hash
		self.replaced
	end
end
