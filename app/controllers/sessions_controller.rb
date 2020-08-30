class SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, only: [ :new, :create ] 
end