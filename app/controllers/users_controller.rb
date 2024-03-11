class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following ]

  private

  #1 If we utilize the before_action by defining a "set_user" under "private" then we do NOT need to define the actions for the controller "Users". The before_action will point to the actions defined inside of %i[] and since we're following convention, the render view templates are automatically defined = no need to define the actions.
  def set_user
    @user = User.find_by!(username: params.fetch(:username))
  end
end
