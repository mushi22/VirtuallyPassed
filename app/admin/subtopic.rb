ActiveAdmin.register Subtopic do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
    form do |f|
	f.inputs "Subtopics" do
	
	f.input :topic_id, :label => 'Topics', :as => :select, :collection => Topic.all.map{|u| ["#{u.name}", u.id]}
	f.input :name
	f.input :video_link, :label => 'Video Code'
	f.input :description, :input_html => { :class => "tinymce" }
  end
    f.actions	
  end
  index do
    column :id
	column :name
	column :video_link
	column "Content" do |item|
		strip_tags(item.description)[0,300]
		
	end
	column :created_at
	column :updated_at
	actions 
  end
  permit_params :name, :description, :topic_id, :video_link
  menu label: "Manage Subtopics"
end
