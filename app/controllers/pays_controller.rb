class PaysController < ApplicationController
  
  
	def order_payment
		@document = Document.find_by_id(params[:document_id])
	end	

	 def pay_with_bitcoin
	 	if (params[:document].present?)
	 		user_credentials = {
		    	:access_token => 'access_token',
		    	:refresh_token => 'refresh_token',
		    	:expires_at => Time.now + 1.day
			}

	 		options = { button: 
	 				  	{
	 					 	name: "test",
	 						type: "buy_now", 
	 						callback_url: "http://localhost:3000/pay_callback?secret=834u9hteruhgrghe0ugldrg8u4f487",
	 						# success_url: "https://localhost:3000/pay_successful",
	 						# cancel_url: "https://localhost:3000/pay_cancel",
	 						# auto_redirect: true,
	 						# auto_redirect_success: true,
	 						# auto_redirect_cancel: true,
	 						description: "Sample description",
	 						style: "custom_large"
	 						}
	 					}
			currency = params[:document][:currency].present? ? params[:document][:currency] : "BTC"
			amount_total = params[:document][:price].present? ? params[:document][:price].to_f : 0.0
			user_id = current_user.id
			document_id = params[:document][:id]
			r = $coinbase.create_button "Your Payment redirect_to", amount_total.to_money(currency), "Testing with #{amount_total}#{currency}", "my custom tracking code for this order", options
			puts r.inspect
			puts r.button.code
			puts r.button.callback_url
			puts r.button.success_url
	  		redirect_to "https://coinbase.com/checkouts/#{r.button.code}?user_id=#{user_id}&document_id=#{document_id}"

	 	else
	 		redirect_to "/"
	 	end	
	 end

	 def pay_callback
	 	document_id = params[:document_id]
	 	user_id = params[:user_id]

	 	#check account payment
	 	 # Payment(id: integer, document_id: integer, 
	 	 # 	is_payment_with_signature: boolean, 
	 	 # 	payment_amount: float, created_at: 
	 	 # 	datetime, updated_at: datetime, 
	 	 # 	signer_id: integer, stripe_card_token: string, stripe_customer_id: string)
	 	order = params[:order]
	 	puts 22222
	 	if (order.present? and order[:status] != "expired")
	 		payment = Payment.new({
 				document_id: document_id,
	 			signer_id: current_user.id,
	 			payment_amount: order[:total_btc][:cents],
	 			bitcoin_transaction_id: order[:transaction][:id],
	 			bitcoint_receive_address: order[:receive_address],
	 			bitcoin_order_id: order[:id],
	 			bitcoin_status_order: order[:status]
	 		})
	 		payment.save
	 		redirect_to "/pays/pay_thanks"
	 	else
	 		redirect_to "/pays/pay_not_successful"
	 	end	

	 end	

	 def pay_not_successful

	 end
	 
	 def pay_thanks

	 end	

	 def pay_cancel
	 	puts params.inpsect
	 end	
end
