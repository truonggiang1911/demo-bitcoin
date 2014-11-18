### Note for changed 22h56 pm - 18-11
1. Change routes.rb
	- post - pay_callback
	- get  - pay_cancel - pay_successful

2. Only save payment in Callback return by action post from API Coinbase	

3. Successful payment
	- Add view pay_successful to show some informations which are related with order, customer, payment account, status payment ...


### Getting Started - Set up account and verify secret token app

1. Set up COINBASE_API_KEY and COINBASE_API_SECRET for 3 environmensts
	- Will call it at config/initializers/coinbase.rb


2. Set up SECRET_TOKEN_APP for app - 3 environments
	- To help verify callback for app
	- Can set SECRET_TOKEN_APP at pays_controller to filter action callback


3. Set up callback_url, success_url, cancel_url for 3 enviroments
	- Do same thing with step 1 or 2
	- And go to pays_controller.rb to updated for them follow ENV['...']

### Prepare Send data to API payment

1. Create button with option data
	- See more details https://www.coinbase.com/api/doc/1.0/buttons/create.html

### Using callback - can see more detail in routes.rb to match action of callback

1. Need to recheck
	- Please see more details "Example Callbacks" https://www.coinbase.com/docs/merchant_tools/callbacks

	 Some case need check : Order Callback Example - Payout Callback Example . 

2. Callback when payment is successful - pay_callback
	- Step 1 will be filter by SECRET_TOKEN_APP
	- Recheck status of payment: completed, mispaid, expired. Not doing when expired.
	- When status is completed or mispaid - save data to Payment 
	- May be need to recheck for one case Payout Callback Example. Please see this link for more deatils https://www.coinbase.com/docs/merchant_tools/callbacks

3. Callback when payment is cancel - pay_cancel

.....

