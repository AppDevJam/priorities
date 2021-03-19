Rails.application.routes.draw do

  get("/", { :controller => "pages", :action => "hello"})

  # Routes for the Priority resource:

  # CREATE
  post("/insert_priority", { :controller => "priorities", :action => "create" })
          
  # READ
  get("/priorities", { :controller => "priorities", :action => "index" })
  
  get("/priorities/:path_id", { :controller => "priorities", :action => "show" })
  
  # UPDATE
  
  post("/modify_priority/:path_id", { :controller => "priorities", :action => "update" })
  
  # DELETE
  get("/delete_priority/:path_id", { :controller => "priorities", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
