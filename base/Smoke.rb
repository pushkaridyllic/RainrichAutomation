require 'pry'
require 'selenium-webdriver'
require_relative 'Base'
require "../RainrichAutomation/base/Base.rb"


class Smoke < Base

	def initialize(web_driver)
		@web_driver = web_driver																			
		@objRepo = YAML.load_file("../RainrichAutomation/base/ObjectRepository.yml")
		@config = YAML.load_file("../RainrichAutomation/config/config.yml")
	end

	def open_rainrich_application(task_url)
		$driver.get(task_url)
		sleep 2
		$driver.manage.window.maximize
	
		return text_on_login_page = $driver.find_element(:xpath, @objRepo['text_on_login_page']).text
	end

	def verify_signin

		$driver.find_element(:id, @objRepo['login_id']).send_keys @config['login_id']
		sleep 1
		$driver.find_element(:id, @objRepo['password']).send_keys @config['password']
		sleep 1
		$driver.find_element(:xpath, @objRepo['login_button']).click

		return text_on_dashboard = $driver.find_element(:xpath, @objRepo['dashboard']).text
	end

	def verify_navigate_customers_dashboard

		sleep  3
		$driver.find_element(:xpath, @objRepo['customers_link']).click
		#waitDisplayIconTrash.until {$driver.find_element(:xpath => @objRepo['last_record_on_customers'])}
		sleep 3
		return text_on_dashboard = $driver.find_element(:xpath, @objRepo['customers_dashboard']).text

	end

	def verify_add_new_customer

		$driver.find_element(:xpath, @objRepo['add_new_customer']).click
		sleep 2
		$driver.find_element(:id, @objRepo['first_name']).send_keys @config['first_name']
		sleep 2
		$driver.find_element(:id, @objRepo['last_name']).send_keys @config['last_name']
		sleep 2
		$driver.find_element(:id, @objRepo['email']).send_keys @config['email']
		sleep 2
		$driver.find_element(:id, @objRepo['phone_no']).send_keys @config['phone']
		sleep 2
		$driver.find_element(:xpath, @objRepo['save_button_customer']).click
		sleep 3

		#el = $driver.find_element(:xpath, @objRepo['success_message'])

		#puts el

		#$driver.move_to(el).perform
		#$driver.mouse.move_to(el)

		#wait_for_success_message = Selenium::WebDriver::Wait.new(:timeout => 1)
   		#wait_for_success_message.until {$driver.find_element(:xpath => @objRepo['success_message'])}

   		#return success_message = $driver.find_element(:xpath, @objRepo['success_message']).text

	end

	def verify_schedule_order

		$driver.find_element(:xpath, @objRepo['scheduling_icon']).click
		sleep 3
		$driver.find_element(:xpath, @objRepo['add_appointment']).click
		sleep 3
		$driver.find_element(:xpath, @objRepo['calendar_icon']).click
		sleep 2
		$driver.find_element(:xpath, @objRepo['calendar_icon']).click
		sleep 2
		$driver.find_element(:xpath, @objRepo['time_icon']).click
		sleep 2
		$driver.find_element(:xpath, @objRepo['cusomer_field']).send_keys @config['search_customer']
		sleep 3
		$driver.find_element(:xpath, @objRepo['first_serch_result']).click
		sleep 2
		#$driver.find_element(:id, @objRepo['work_order_printed']).click
		#sleep 4

		#element = $driver.find_element(:xpath, @objRepo['save_button_appointment'])
		#element.location_once_scrolled_into_view
		#page.execute_script ("window.scrollBy(0,250)")


		$driver.find_element(:xpath, @objRepo['save_button_appointment']).click
		sleep 5

	end



end