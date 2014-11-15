== Getting Started - Set up account and verify secret token app

1. Set up COINBASE_API_KEY and COINBASE_API_SECRET for 3 environmensts
	- Will call it at config/initializers/coinbase.rb


2. Set up SECRET_TOKEN_APP for app - 3 environments
	- To help verify callback for app
	- Can set SECRET_TOKEN_APP at pays_controller to filter action callback


3. Set up callback_url, success_url, cancel_url for 3 enviroments
	- Do same thing with step 1 or 2
	- And go to pays_controller.rb to updated for them follow ENV['...']
	
== Using callback - can see more detail in routes.rb to match action of callback

1. Callback when payment is successful - pay_callback
	- Step 1 will be filter by SECRET_TOKEN_APP
	- Recheck status of payment: completed, mispaid, expired. Not doing when expired.
	- When status is completed or mispaid - save data to Payment 
2. Callback when payment is cancel - pay_cancel


