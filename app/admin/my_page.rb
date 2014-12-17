ActiveAdmin.register_page "My Page" do

    sidebar :help do
      ul do
        li "First Line of Help"
        li "First Second of Help"
      end
    end

   page_action :ex, :method => :post do
      # do stuff here
      redirect_to admin_my_page_path, :notice => "You did stuff!"
    end

    action_item do
      link_to "View Cart", cart_products_path, :method => :get
    end

    content do
      para "Content Page"
	  form do |f|
		     
			
	 end	
	
    end
end