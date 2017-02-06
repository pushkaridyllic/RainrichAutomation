require 'yaml'
require 'rspec'
require 'pry'
require 'rspec/autorun'
require 'rspec/expectations'
require "../RainrichAutomation/base/Smoke.rb"
require "../RainrichAutomation/base/Base.rb"


class SmokeTest < Base

	
	describe 'smoke test on Rainrich application : ' do 

		before(:all) do
	    	
			@config = YAML.load_file("../RainrichAutomation/config/config.yml")
	    	@task_url = @config['url']
	    	@smoke = Smoke.new(Base.new())
		
  		end


		it 'verify open rainrich url' do
			
			expect(@smoke.open_rainrich_application(@task_url)).to eq("Password")

		end


		it 'verify successful login' do
			
			expect(@smoke.verify_signin).to eq("Dashboard")

		end

		it 'verify navigate to customer' do

			expect(@smoke.verify_navigate_customers_dashboard).to eq("Customers")

		end

		it 'verfy add new customer' do

			@smoke.verify_add_new_customer
			

		end

		it 'verify search and add new order' do

			@smoke.verify_schedule_order

		end



	end


end

																																																																																																																																																																																																																																																																								