class PrioritiesController < ApplicationController
  def index
    matching_priorities = @current_user.priorities

    @list_of_priorities = matching_priorities.order({ :created_at => :desc })

    render({ :template => "priorities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_priorities = Priority.where({ :id => the_id })

    @the_priority = matching_priorities.at(0)

    render({ :template => "priorities/show.html.erb" })
  end

  def create
      the_priority = Priority.new
      the_priority.description = params.fetch("query_description")
      the_priority.day = params.fetch("query_day")
      the_priority.user_id = @current_user.id
 

    if the_priority.valid?
      the_priority.save
      redirect_to("/priorities", { :notice => "Priority created successfully." })
    else
      redirect_to("/priorities", { :notice => the_priority.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_priority = Priority.where({ :id => the_id }).at(0)

    the_priority.description = params.fetch("query_description")
    the_priority.day = params.fetch("query_day")
    the_priority.user_id = params.fetch("query_user_id")
    the_priority.priority_accomplished = params.fetch("query_priority_accomplished", false)

    if the_priority.valid?
      the_priority.save
      redirect_to("/priorities/#{the_priority.id}", { :notice => "Priority updated successfully."} )
    else
      redirect_to("/priorities/#{the_priority.id}", { :alert => "Priority failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_priority = Priority.where({ :id => the_id }).at(0)

    the_priority.destroy

    redirect_to("/priorities", { :notice => "Priority deleted successfully."} )
  end
end
