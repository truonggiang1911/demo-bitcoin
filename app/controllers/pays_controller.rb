class PaysController < ApplicationController

	#config SECRET_TOKEN_APP for 3 environment
    SECRET_TOKEN_APP = "g8u4f4834grghu9hteruhe0ugldr88"
	
	before_filter :check_secret_token_callback, :only => [:pay_callback, :pay_cancel, :pay_successful]
	
	def order_payment
		@document = Document.find_by_id(params[:document_id])
	end	

	 def pay_with_bitcoin
	 	if (params[:document].present?)
	 		currency = params[:document][:currency].present? ? params[:document][:currency] : "BTC"
			amount_total = params[:document][:price].present? ? params[:document][:price].to_f : 0.0
			user_id = current_user.id
			document_id = params[:document][:id]

	 		options = { button: 
	 				  	{
	 					 	name: "test",
	 						type: "buy_now", 
	 						custom: document_id,
	 						callback_url: "http://localhost:3000/pay_callback?secret=#{SECRET_TOKEN_APP}",
	 						success_url: "http://localhost:3000/pay_successful?secret=#{SECRET_TOKEN_APP}",
	 						cancel_url: "http://localhost:3000/pay_cancel?secret=#{SECRET_TOKEN_APP}",
	 						auto_redirect: true,
	 						auto_redirect_success: true,
	 						auto_redirect_cancel: true,
	 						description: "Sample description",
	 						style: "custom_large"
	 						}
	 					}

			r = $coinbase.create_button "Your Payment redirect_to", amount_total.to_money(currency), "Testing with #{amount_total}#{currency}", "my custom tracking code for this order", options
	  		redirect_to "https://coinbase.com/checkouts/#{r.button.code}"

	 	else
	 		redirect_to "/"
	 	end	
	 end

	 def pay_callback
	 	order = params[:order]
	 	if (order.present? and order[:status] != "expired")
	 		payment = Payment.new({
 				document_id: order[:custom],
	 			signer_id: current_user.id,
	 			payment_amount: order[:total_native][:cents],
	 			bitcoin_total_btc: order[:total_btc][:cents],
	 			bitcoin_total_native: order[:total_native][:cents],
	 			bitcoin_total_payout: order[:total_payout][:cents],
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

	 	order = params[:order]
	 	if (order.present?)
	 		redirect_to "/order_payment?document_id=#{order[:custom]}"
	 	else
	 		redirect_to "/"
	 	end	
	 end	


	 def pay_successful
	 	order = params[:order]

	 	if (order.present? and order[:status] != "expired")
	 		payment = Payment.new({
 				document_id: order[:custom],
	 			signer_id: current_user.id,
	 			payment_amount: order[:total_native][:cents],
	 			bitcoin_total_btc: order[:total_btc][:cents],
	 			bitcoin_total_native: order[:total_native][:cents],
	 			bitcoin_total_payout: order[:total_payout][:cents],
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


	 private
	 	#check scret token app to valid callback
	 	def check_secret_token_callback
	 		if (params[:secret] == SECRET_TOKEN_APP)
	 		else
	 			redirect_to "/"
	 		end	
	 	end	
end
