module LayoutHelper
	def jquery_version
	   # Choose the jQuery version you would like to use from the CDN
	   "2.1.1"
	end

	def jqueryui_version
	   # Choose the jQuery version you would like to use from the CDN
	   "1.10.4"
	end

	def bootstrap_version
	   # Choose the Bootstrap version you would like to use from the CDN
	   "3.1.1"
	end

	def angular_version
	   # Choose the AngularJS version you would like to use from the CDN
	   "1.2.0"
	end

	def restangular_version
	   # Choose the Restangular version you would like to use from the CDN
	   "1.3.1"
	end

	def underscore_version
	   # Choose the Restangular version you would like to use from the CDN
	   "1.6.0"
	end

	def do_not_minify_development(del = ".")
		# For non-development environments, load minified files from CDN
		if !Rails.env.development?
			del + "min"
		end
	end
end
