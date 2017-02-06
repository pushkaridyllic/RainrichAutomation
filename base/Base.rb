require 'selenium-webdriver'
require 'pry'
require 'yaml'

$driver = nil

class Base

	def initialize (*args)
	  	$driver = Selenium::WebDriver.for :chrome
	end

	def open_browser
		$driver.get(host)
	end

end
