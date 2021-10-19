class RecipesController < ApplicationController
    def index
        if session[:user_id]
            render json: Recipe.all
        else
            render json: { error: "Not authorized"}, status: :unauthorized
        end
    end

    def create 
        user = User.find_by(id: session[:user_id])
        if user
            recipe = user.recipes.create(recipe_params)
            if recipe.valid?
                render json: recipe, status: :created
            else
                render json: { errrors: recipe.errors }, status: :unprocessable_entity
            end
        else
            render json: { error: "Not authorized"}, status: :unauthorized
        end
    end

    private 

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

end
