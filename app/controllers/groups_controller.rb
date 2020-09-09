class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
        @genres = Genre.all
    end

    def show
        @group = get_group
    end

    def create
        @group = Group.create(:name => group_params[:name], :description => group_params[:description])
        genre_ids = group_params[:genre_ids]

        genre_ids.each do |gi|
            gg = @group.group_genres.build(group_id: @group.id, genre_id: gi.to_i)
            gg.save
        end
        redirect_to group_path(@group)

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def get_group
        Group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:name, :description, :genre_ids => [])
    end

end
