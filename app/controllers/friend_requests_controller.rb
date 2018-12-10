class FriendRequestsController < ApplicationController
  def index
    @q = FriendRequest.ransack(params[:q])
    @friend_requests = @q.result(:distinct => true).includes(:receipient).page(params[:page]).per(10)

    render("friend_request_templates/index.html.erb")
  end

  def show
    @friend_request = FriendRequest.find(params.fetch("id_to_display"))

    render("friend_request_templates/show.html.erb")
  end

  def new_form
    @friend_request = FriendRequest.new

    render("friend_request_templates/new_form.html.erb")
  end

  def create_row
    @friend_request = FriendRequest.new

    @friend_request.receipient_id = params.fetch("receipient_id")
    @friend_request.sender_id = params.fetch("sender_id")

    if @friend_request.valid?
      @friend_request.save

      redirect_back(:fallback_location => "/friend_requests", :notice => "Friend request created successfully.")
    else
      render("friend_request_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @friend_request = FriendRequest.find(params.fetch("prefill_with_id"))

    render("friend_request_templates/edit_form.html.erb")
  end

  def update_row
    @friend_request = FriendRequest.find(params.fetch("id_to_modify"))

    @friend_request.receipient_id = params.fetch("receipient_id")
    @friend_request.sender_id = params.fetch("sender_id")

    if @friend_request.valid?
      @friend_request.save

      redirect_to("/friend_requests/#{@friend_request.id}", :notice => "Friend request updated successfully.")
    else
      render("friend_request_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_receipient
    @friend_request = FriendRequest.find(params.fetch("id_to_remove"))

    @friend_request.destroy

    redirect_to("/users/#{@friend_request.receipient_id}", notice: "FriendRequest deleted successfully.")
  end

  def destroy_row
    @friend_request = FriendRequest.find(params.fetch("id_to_remove"))

    @friend_request.destroy

    redirect_to("/friend_requests", :notice => "Friend request deleted successfully.")
  end
end
