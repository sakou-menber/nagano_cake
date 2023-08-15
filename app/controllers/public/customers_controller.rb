class Public::CustomersController < ApplicationController

   def show
     @customer = current_customer

   end

   def edit
   end

   def update
   end

   def check

   end

   def withdraw
     @customer = current_customer
     @customer.update(is_deleted: true)
     reset_session
     flash[:notice] = "退会処理を実行いたしました"
     redirect_to new_customer_registration_path
   end


end
